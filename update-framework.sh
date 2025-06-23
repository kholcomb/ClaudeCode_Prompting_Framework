#!/bin/bash
# Update Multi-Persona Framework to latest version

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🔄 Multi-Persona Framework Update${NC}"
echo "===================================="

# Check if we're in framework root
if [[ ! -f "CLAUDE.md" ]] || [[ ! -f "VERSION" ]]; then
    echo -e "${RED}❌ This script must be run from the framework root directory${NC}"
    exit 1
fi

# Get current version
CURRENT_VERSION=$(cat VERSION)
echo -e "Current version: ${YELLOW}$CURRENT_VERSION${NC}"

# Backup current state
echo "📦 Creating backup..."
BACKUP_DIR="backups/framework-$CURRENT_VERSION-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup important files
cp -r CLAUDE.md VERSION README.md specs/ logs/session-state.json "$BACKUP_DIR/" 2>/dev/null || true
echo -e "${GREEN}✅ Backup created in $BACKUP_DIR${NC}"

# Fetch latest version from repository
echo "⬇️  Fetching latest version..."
REPO_URL="https://github.com/yourusername/multi_agent_prompting_framework_template.git"
TEMP_DIR=$(mktemp -d)

git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
    echo -e "${RED}❌ Failed to fetch latest version${NC}"
    echo "Please check your internet connection or update manually"
    rm -rf "$TEMP_DIR"
    exit 1
}

# Get new version
NEW_VERSION=$(cat "$TEMP_DIR/VERSION")
echo -e "Latest version: ${YELLOW}$NEW_VERSION${NC}"

if [[ "$CURRENT_VERSION" == "$NEW_VERSION" ]]; then
    echo -e "${GREEN}✅ You are already on the latest version!${NC}"
    rm -rf "$TEMP_DIR"
    exit 0
fi

# Update framework files
echo "📝 Updating framework files..."
cp "$TEMP_DIR/CLAUDE.md" ./CLAUDE.md
cp "$TEMP_DIR/VERSION" ./VERSION
cp "$TEMP_DIR/README.md" ./README-new.md

# Update templates
cp -r "$TEMP_DIR/templates/"* ./templates/ 2>/dev/null || true

# Clean up
rm -rf "$TEMP_DIR"

echo -e "${GREEN}✅ Framework updated to version $NEW_VERSION${NC}"
echo ""
echo "⚠️  Please review:"
echo "  • README-new.md for changes (compare with your README.md)"
echo "  • Your session state may need adjustments"
echo "  • Check CHANGELOG.md for breaking changes"
echo ""
echo "Your previous configuration is backed up in: $BACKUP_DIR"