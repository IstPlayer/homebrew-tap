class MpvMacwrapper < Formula
  desc "Wrap mpv CLI as a native macOS .app bundle"
  homepage "https://github.com/IstPlayer/mpv-macWrapper"
  url "https://github.com/IstPlayer/mpv-macWrapper/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f5982a0e2578e7470b144e9fa3c51de9cd84d1bfdf0ea0c4c254f578d9edf410"
  license "GPL-2.0-or-later"
  version "1.1.0"

  depends_on "mpv"
  depends_on macos: :monterey

  def install
    system "make"
    prefix.install "mpv.app"
  end

  def caveats
    <<~EOS
      Apple Silicon (arm64) only.  mpv must be installed separately:
        brew install mpv

      If mpv is not found at the default paths, the app will
      prompt you to locate it on first launch.

      To use, link the app to your Applications folder:
        ln -sf #{prefix}/mpv.app ~/Applications/mpv.app
    EOS
  end

  test do
    system "#{prefix}/mpv.app/Contents/MacOS/mpv", "--version"
  end
end
