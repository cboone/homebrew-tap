class GhProblemas < Formula
  desc "TUI for GitHub issue management"
  homepage "https://github.com/cboone/gh-problemas"
  head "https://github.com/cboone/gh-problemas.git", branch: "main"
  license "MIT"

  depends_on "gh"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"gh-problemas"), "."
  end

  test do
    assert_match "gh-problemas", shell_output("#{bin}/gh-problemas --help")
  end
end
