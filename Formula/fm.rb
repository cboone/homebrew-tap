class Fm < Formula
  desc "Safe, read-oriented CLI for Fastmail email via JMAP"
  homepage "https://github.com/cboone/fm"
  head "https://github.com/cboone/fm.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"fm"), "."
  end

  def caveats
    <<~EOS
      fm requires a Fastmail API token.

      Set it with:
        export FM_TOKEN="..."
    EOS
  end

  test do
    assert_match "fm", shell_output("#{bin}/fm --help")
  end
end
