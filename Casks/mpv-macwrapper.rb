cask "mpv-macwrapper" do
  version "1.1.6"
  sha256 "75b593ae55540eb38ea920242740500b2053bb36a2c4d307b05a4e2397e3ab21"

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
