class MpvMacwrapper < Formula
  desc "Wrap mpv CLI as a native macOS .app bundle"
  homepage "https://github.com/IstPlayer/mpv-macWrapper"
  url "https://github.com/IstPlayer/mpv-macWrapper/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "de6543a4fe9eea00aa843db74875d1d7cd513f87022123ca8f4f618d2ff06e3e"
  license "GPL-2.0-or-later"
  version "1.0.0"

  depends_on "mpv"
  depends_on xcode: :build

  def install
    system "make"
    prefix.install "mpv.app"
  end

  def caveats
    <<~EOS
      To use mpv-macWrapper, copy the app to /Applications:
        cp -R #{prefix}/mpv.app /Applications/

      Or link it:
        ln -sf #{prefix}/mpv.app /Applications/mpv.app
    EOS
  end

  test do
    system "#{prefix}/mpv.app/Contents/MacOS/mpv", "--version"
  end
end
