class MpvMacwrapper < Formula
  desc "Wrap mpv CLI as a native macOS .app bundle"
  homepage "https://github.com/IstPlayer/mpv-macWrapper"
  url "https://github.com/IstPlayer/mpv-macWrapper/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "de6543a4fe9eea00aa843db74875d1d7cd513f87022123ca8f4f618d2ff06e3e"
  license "GPL-2.0-or-later"
  version "1.0.0"

  depends_on "mpv"
  depends_on macos: :monterey

  def install
    system "make"
    prefix.install "mpv.app"
  end

  def post_install
    target = "#{Dir.home}/Applications"
    system "mkdir", "-p", target
    system "ln", "-sf", "#{prefix}/mpv.app", "#{target}/mpv.app"
    system "killall", "Dock"
  end

  def post_uninstall
    target = "#{Dir.home}/Applications/mpv.app"
    system "rm", "-f", target
  end

  def caveats
    <<~EOS
      Apple Silicon (arm64) only.  mpv must be installed separately:
        brew install mpv

      If mpv is not found at the default paths, the app will
      prompt you to locate it on first launch.
    EOS
  end

  test do
    system "#{prefix}/mpv.app/Contents/MacOS/mpv", "--version"
  end
end
