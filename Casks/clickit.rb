cask "clickit" do
  version "1.6.3"
  sha256 "PLACEHOLDER_WILL_BE_SET_BY_CI"

  url "https://github.com/jsonify/ClickIt/releases/download/v#{version}/ClickIt-#{version}.dmg"
  name "ClickIt"
  desc "Native macOS auto-clicker with precision timing and window targeting"
  homepage "https://github.com/jsonify/ClickIt"

  app "ClickIt.app"

  postinstall do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClickIt.app"]
  end

  uninstall quit: "com.jsonify.clickit"

  zap trash: [
    "~/Library/Application Support/ClickIt",
    "~/Library/Preferences/com.jsonify.clickit.plist",
  ]
end