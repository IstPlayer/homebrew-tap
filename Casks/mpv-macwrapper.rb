cask "mpv-macwrapper" do
  version "1.1.5"
  sha256 "192b6bada7d8c6f48ede8a4307c36cbb87f9f8333c73f2cbde992889d727cc20"

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
