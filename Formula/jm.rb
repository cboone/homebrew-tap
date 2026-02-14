class Jm < Formula
  desc "Safe, read-oriented CLI for JMAP email"
  homepage "https://github.com/cboone/jm"
  head "https://github.com/cboone/jm.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"jm"), "."
  end

  def caveats
    <<~EOS
      jm requires a JMAP token.

      Set it with:
        export JMAP_TOKEN="..."
    EOS
  end

  test do
    assert_match "JMAP", shell_output("#{bin}/jm --help")
  end
end
