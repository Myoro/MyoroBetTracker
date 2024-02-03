#!/bin/bash

clear

cd "$(dirname "$0")/.."

if [ -d "build" ]; then
  rm -rf build
fi

flutter pub cache clean -f
flutter clean
flutter pub get
flutter build linux --release

cd build/linux/x64/release/bundle

# The installation script
cat <<EOF > install.sh
#!/bin/bash

touch myoro_bet_tracker.desktop
echo "[Desktop Entry]" >> myoro_bet_tracker.desktop
echo "Version=1.0.0+1" >> myoro_bet_tracker.desktop
echo "Name=MyoroBetTracker" >> myoro_bet_tracker.desktop
echo "Comment=An application to better document your betting history" >> myoro_bet_tracker.desktop
echo "Exec=/usr/local/bin/MyoroBetTracker/MyoroBetTracker" >> myoro_bet_tracker.desktop
echo "Icon=/usr/local/bin/MyoroBetTracker/icon.png" >> myoro_bet_tracker.desktop
echo "Type=Application" >> myoro_bet_tracker.desktop
echo "Categories=Utility" >> myoro_bet_tracker.desktop
mv myoro_bet_tracker.desktop /usr/share/applications/

cd ..
mv MyoroBetTracker /usr/local/bin/
rm /usr/local/bin/MyoroBetTracker/install.sh
cd /usr/local/bin/MyoroBetTracker

echo "Installed successfully 😁"
EOF

chmod +x install.sh

# Setting up the release folder
mkdir MyoroBetTracker
mv data MyoroBetTracker
mv lib MyoroBetTracker
mv myoro_bet_tracker MyoroBetTracker/MyoroBetTracker
mv install.sh MyoroBetTracker/
cp ../../../../../icons/250x250.png MyoroBetTracker/icon.png
zip -r MyoroBetTrackerLinux.zip -r MyoroBetTracker
rm -rf MyoroBetTracker