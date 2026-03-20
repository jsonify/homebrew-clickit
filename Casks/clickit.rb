cask "clickit" do
    version "main"
    sha256 "a0590081fe1bfd955804c7d671cc5254e8afcea3d9a36e19cece768e3bed6401"

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