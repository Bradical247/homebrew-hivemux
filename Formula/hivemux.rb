class Hivemux < Formula
  desc "Linux-native, tmux-backed orchestrator for parallel AI coding agents"
  homepage "https://github.com/Bradical247/hivemux"
  version "1.7.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.7.0/hivemux-macos-arm64"
      sha256 "340501d8626277f5149b6fda4a3dde0c293a8076e3e03bf22736bed5d1d28a9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.7.0/hivemux-linux-x64"
      sha256 "a998f09b07743bf982afacaef10d4300315306c6d52e5c59509fd52e8568401f"
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
    assert_match "1.7.0", shell_output("#{bin}/hivemux --version")
  end
end
