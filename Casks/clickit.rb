cask "clickit" do
  version "1.6.11"
  sha256 "660d0f2736f40fe25c36e8f590b1441561d94d2d2b5ce3b34d656603b1ba1191"

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