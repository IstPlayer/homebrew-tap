cask "mpv-macwrapper" do
  version "1.1.7"
  sha256 "2d11a53213022b6b26c60ef639852f9b261c2712e385c04a7657495e20509f0c"

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
