class Hivemux < Formula
  desc "Linux-native, tmux-backed orchestrator for parallel AI coding agents"
  homepage "https://github.com/Bradical247/hivemux"
  version "1.6.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.6.0/hivemux-macos-arm64"
      sha256 "8e3c722aa7129425cfa43eeeba3d80d2d504930cd74a45eaa785b48c5548fef1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bradical247/hivemux/releases/download/v1.6.0/hivemux-linux-x64"
      sha256 "79387fd83df4a8e2af18cafc9ac375fab6620bb396b6e8ca58f7dfa0d6792cce"
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
    assert_match "1.6.0", shell_output("#{bin}/hivemux --version")
  end
end
