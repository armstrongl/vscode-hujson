#!/bin/bash
#
# Release script for vscode-hujson
#
# Usage: ./scripts/release.sh <version>
# Example: ./scripts/release.sh 1.2.0
#
# This script:
#   1. Validates the version format
#   2. Updates the version in package.json
#   3. Updates docs/changelog.md with a new entry
#   4. Commits the changes
#   5. Creates a git tag
#   6. Pushes the commit and tag to origin

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the script's directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Change to project root
cd "$PROJECT_ROOT"

# Check for required argument
if [ -z "$1" ]; then
    echo -e "${RED}Error: Version number required${NC}"
    echo "Usage: ./scripts/release.sh <version>"
    echo "Example: ./scripts/release.sh 1.2.0"
    exit 1
fi

VERSION="$1"
TAG="v$VERSION"

# Validate version format (semver)
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo -e "${RED}Error: Invalid version format '$VERSION'${NC}"
    echo "Version must be in semver format: X.Y.Z (e.g., 1.2.0)"
    exit 1
fi

# Check for uncommitted changes (allow staged changes to changelog/package.json)
if ! git diff --quiet --exit-code -- ':!package.json' ':!docs/changelog.md'; then
    echo -e "${RED}Error: You have uncommitted changes${NC}"
    echo "Please commit or stash your changes before releasing."
    git status --short
    exit 1
fi

# Check if tag already exists
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo -e "${RED}Error: Tag '$TAG' already exists${NC}"
    exit 1
fi

# Get current version from package.json
CURRENT_VERSION=$(node -p "require('./package.json').version")

echo -e "${GREEN}Release: $CURRENT_VERSION → $VERSION${NC}"
echo ""

# Update package.json version
echo -e "${YELLOW}Updating package.json...${NC}"
node -e "
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
pkg.version = '$VERSION';
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
"
echo "  ✓ package.json updated to $VERSION"

# Update changelog
echo -e "${YELLOW}Updating docs/changelog.md...${NC}"
TODAY=$(date +%Y-%m-%d)
CHANGELOG_FILE="docs/changelog.md"

# Check if version entry already exists
if grep -q "## \[$VERSION\]" "$CHANGELOG_FILE"; then
    echo "  ✓ Changelog entry for $VERSION already exists"
else
    # Create a new changelog entry after the header lines
    # Insert after line 5 (after the format description)
    node -e "
const fs = require('fs');
const changelog = fs.readFileSync('$CHANGELOG_FILE', 'utf8');
const lines = changelog.split('\n');

// Find the first version entry (## [x.x.x])
let insertIndex = -1;
for (let i = 0; i < lines.length; i++) {
    if (lines[i].match(/^## \[\d+\.\d+\.\d+\]/)) {
        insertIndex = i;
        break;
    }
}

if (insertIndex === -1) {
    console.error('Could not find existing version entry in changelog');
    process.exit(1);
}

// Create new entry
const newEntry = [
    '## [$VERSION] - $TODAY',
    '',
    '### Added',
    '',
    '- <!-- Add new features here -->',
    '',
    '### Changed',
    '',
    '- <!-- Add changes here -->',
    '',
    '### Fixed',
    '',
    '- <!-- Add fixes here -->',
    '',
];

// Insert new entry
lines.splice(insertIndex, 0, ...newEntry);

// Update version history table if it exists
const tableIndex = lines.findIndex(l => l.includes('| Version | Date | Highlights |'));
if (tableIndex !== -1) {
    // Find the line after the header separator
    for (let i = tableIndex + 2; i < lines.length; i++) {
        if (lines[i].startsWith('|')) {
            // Insert new row and remove any 'Unreleased' row
            if (lines[i].includes('Unreleased')) {
                lines[i] = '| $VERSION | $TODAY | <!-- Add highlights --> |';
            } else {
                lines.splice(i, 0, '| $VERSION | $TODAY | <!-- Add highlights --> |');
            }
            break;
        }
    }
}

fs.writeFileSync('$CHANGELOG_FILE', lines.join('\n'));
"
    echo "  ✓ Added changelog entry for $VERSION"
    echo ""
    echo -e "${YELLOW}Please edit docs/changelog.md to fill in the release notes.${NC}"
    echo "Press Enter when ready to continue, or Ctrl+C to abort..."
    read -r
fi

# Verify the changelog was updated (no placeholder comments)
if grep -q "<!-- Add" "$CHANGELOG_FILE"; then
    echo -e "${YELLOW}Warning: Changelog still contains placeholder comments.${NC}"
    echo "Do you want to continue anyway? (y/N)"
    read -r CONTINUE
    if [[ ! "$CONTINUE" =~ ^[Yy]$ ]]; then
        echo "Aborting. Please update the changelog and run again."
        exit 1
    fi
fi

# Stage changes
echo -e "${YELLOW}Staging changes...${NC}"
git add package.json docs/changelog.md
echo "  ✓ Changes staged"

# Show what will be committed
echo ""
echo -e "${YELLOW}Changes to be committed:${NC}"
git diff --cached --stat
echo ""

# Confirm before committing
echo "Proceed with commit and tag? (y/N)"
read -r CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Aborting."
    git restore --staged package.json docs/changelog.md
    git checkout package.json docs/changelog.md
    exit 1
fi

# Commit
echo -e "${YELLOW}Creating commit...${NC}"
git commit -m "Release $TAG"
echo "  ✓ Committed"

# Create tag
echo -e "${YELLOW}Creating tag $TAG...${NC}"
git tag "$TAG"
echo "  ✓ Tag created"

# Push
echo -e "${YELLOW}Pushing to origin...${NC}"
git push origin main "$TAG"
echo "  ✓ Pushed commit and tag"

echo ""
echo -e "${GREEN}Release $TAG complete!${NC}"
echo ""
echo "GitHub Actions will now build and publish the release."
echo "View the release at: https://github.com/armstrongl/vscode-hujson/releases/tag/$TAG"
