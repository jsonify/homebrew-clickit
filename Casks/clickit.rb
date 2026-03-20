cask "clickit" do
    version "1.6.4"
    sha256 "6d2bd8b915539b0daba33951363f86e97135993c6c49365a54351363309726b7"

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
