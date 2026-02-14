class RightRound < Formula
  desc "Browse and preview terminal progress indicators"
  homepage "https://github.com/cboone/right-round"
  head "https://github.com/cboone/right-round.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"right-round"), "./cmd/right-round"
  end

  test do
    assert_match "right-round", shell_output("#{bin}/right-round --help")
  end
end
