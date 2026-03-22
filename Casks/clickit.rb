cask "clickit" do
  version "1.6.7"
  sha256 "34419549b83b38ff717934c8e4523cb3ee9f81327e8e1956087fcd218fb8c1e3"

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