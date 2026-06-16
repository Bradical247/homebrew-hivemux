class Hivemux < Formula
  desc "Linux-native, tmux-backed orchestrator for parallel AI coding agents"
  homepage "https://github.com/Bradical247/hivemux"
  version "1.5.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.5.0/hivemux-macos-arm64"
      sha256 "8fa439093955f1b8a4ef697a088216988bfcf8464521908c482eb1c3c5512c5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.5.0/hivemux-linux-x64"
      sha256 "56823ce4d7515bb8882012ea0c7375c41cfac6413f5fdfc10c178db34e5a0d27"
    end
  end

  def install
    bin.install Dir["hivemux-*"].first => "hivemux"
  end

  def caveats
    <<~EOS
      The web GUI also needs ttyd and a browser:
        brew install ttyd
    EOS
  end

  test do
    assert_match "1.5.0", shell_output("#{bin}/hivemux --version")
  end
end
