cask "mpv-macwrapper" do
  version "1.1.0"
  sha256 "c90f80708196f7db8c79e485199edd3d4b4e867089444d932ad01b1261b59f35"

  url "https://github.com/IstPlayer/mpv-macWrapper/releases/download/v#{version}/mpv.dmg"
  name "mpv-macWrapper"
  desc "Wrap mpv CLI as a native macOS .app bundle"
  homepage "https://github.com/IstPlayer/mpv-macWrapper"

  depends_on macos: ">= :monterey"

  app "mpv.app"

  caveats <<~EOS
    Apple Silicon (arm64) only.  mpv must be installed separately:
      brew install mpv

    If mpv is not found at the default paths, the app will
    prompt you to locate it on first launch.
  EOS
end
