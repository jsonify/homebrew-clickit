cask "clickit" do
  version "1.6.12"
  sha256 "29310003228c2dcd9d0a13a51951b133275264d26c40b17bc0f8b3ab19b98b2a"

  url "https://github.com/jsonify/ClickIt/releases/download/v#{version}/ClickIt-#{version}.dmg"
  name "ClickIt"
  desc "Native macOS auto-clicker with precision timing and window targeting"
  homepage "https://github.com/jsonify/ClickIt"

  app "ClickIt.app"

  # App is not yet notarized — remove Gatekeeper quarantine so it can be opened
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{staged_path}/ClickIt.app"],
                   sudo: false
  end

  uninstall quit: "com.jsonify.clickit"

  zap trash: [
    "~/Library/Application Support/ClickIt",
    "~/Library/Preferences/com.jsonify.clickit.plist",
  ]
end