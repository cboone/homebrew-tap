class Pbcopy2 < Formula
  desc "Modern pbcopy and pbpaste: concealment, auto-clear, type selection"
  homepage "https://github.com/cboone/pbcopy2"
  version "0.8.0"
  license "MIT"

  depends_on :macos

  on_intel do
    url "https://github.com/cboone/pbcopy2/releases/download/v0.8.0/pbcopy2-0.8.0-darwin-amd64.tar.gz"
    sha256 "b95b7a909f8f49e256d38779bc1cd5b40af1516e1dac4b117e0fd59ddcf88299"
  end

  on_arm do
    url "https://github.com/cboone/pbcopy2/releases/download/v0.8.0/pbcopy2-0.8.0-darwin-arm64.tar.gz"
    sha256 "7a244d3316cd907a5b75bf1677eaa99814c73947a8926db1a6f63ac0b2b0a589"
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    cd "pbcopy2-#{version}-darwin-#{arch}" do
      bin.install "pbcopy2"
      bin.install "pbpaste2"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pbcopy2 --version")
    assert_match version.to_s, shell_output("#{bin}/pbpaste2 --version")
  end
end
