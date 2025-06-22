#!/usr/bin/env bash

echo "Available macOS versions:"
echo "========================"
echo "1. High Sierra (10.13)"
echo "2. Mojave (10.14)"
echo "3. Catalina (10.15)"
echo "4. Big Sur (11.7)"
echo "5. Monterey (12.6)"
echo "6. Ventura (13)"
echo "7. Sonoma (14) - RECOMMENDED"
echo "8. Sequoia (15)"

echo ""
read -p "Choose a macOS version to install (1-8): " choice

# Validate input
if [[ ! "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt 8 ]; then
    echo "Invalid choice. Please enter a number between 1 and 8."
    exit 1
fi

# Map choice to version name
case $choice in
    1) selected_version="High Sierra" ;;
    2) selected_version="Mojave" ;;
    3) selected_version="Catalina" ;;
    4) selected_version="Big Sur" ;;
    5) selected_version="Monterey" ;;
    6) selected_version="Ventura" ;;
    7) selected_version="Sonoma" ;;
    8) selected_version="Sequoia" ;;
esac

echo ""
echo "Selected: $selected_version"
echo ""

# Proceed with installation
cd /Volumes/macOS
mkdir -p private/tmp
cp -R "/Install macOS $selected_version.app" private/tmp
cd "private/tmp/Install macOS $selected_version.app"
mkdir Contents/SharedSupport
cp -R /Volumes/InstallAssistant/InstallAssistant.pkg Contents/SharedSupport/SharedSupport.dmg
./Contents/MacOS/InstallAssistant_springboard
