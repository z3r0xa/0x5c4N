#!/usr/bin/env bash
set -euo pipefail

JAR_URL="${1:-https://github.com/4F63DDE/4F63DDE4F63DDE4F63DDE/raw/main/4F63DDE4F63DDE4F63DDE.jar}"
LIC_URL="${2:-https://raw.githubusercontent.com/z3r0xa/0xL1c3ns3/main/0xScan-1D14F63DDEF3E859.lic}"

echo "This will download 0xScan and a license file: "
read -p "Proceed? [y/N] " ok
if [[ "${ok:-N}" != [Yy]* ]]; then
  echo "Aborted."
  exit 0
fi

TMP_JAR="/tmp/0xScan_download.jar"
TMP_LIC="/tmp/0xScan_license.lic"

echo "Downloading JAR..."
curl -fsSL -o "$TMP_JAR" "$JAR_URL"
echo "Downloading license..."
curl -fsSL -o "$TMP_LIC" "$LIC_URL"

echo "Creating ~/.0xw41th/..."
mkdir -p "$HOME/.0xw41th"

echo "Installing license..."
mv -f "$TMP_LIC" "$HOME/.0xw41th/license.lic"
chmod 600 "$HOME/.0xw41th/license.lic" || true

echo "Installing JAR into current directory as 0xScan.jar"
mv -f "$TMP_JAR" ./0xScan.jar
chmod +rx ./0xScan.jar || true

echo "Installation complete."
echo "Run: java -jar 0xScan.jar < IP >"
