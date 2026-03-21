cask "clickit" do
  version "1.6.5"
  sha256 "82ce531a9bbbb54a4c9e157b74c8050e301e7e8c8049d79268f37ea38c824db6"

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