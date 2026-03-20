cask "clickit" do
    version "1.6.4"
    sha256 "30b03df87a7e993bf6b9085a778b6ca7aaf30d1c0f032677aa6ac7e49d1ed135"

url "https://github.com/jsonify/ClickIt/releases/download/v#{version}/ClickIt-#{version}.dmg" 
name "ClickIt" 
desc "Native macoS auto-clicker with precision timing and window targeting" 
homepage "https://github.com/jsonify/ClickIt"

app "ClickIt.app"

uninstall quit: "com.jsonify.clickit"

zap trash: [
    "~/Library/Application Support/ClickIt",
    "~/Library/Preferences/com.jsonify.clickit.plist",
]
end