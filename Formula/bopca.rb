class Bopca < Formula
  desc "Run LLM agents in lightweight macOS VMs"
  homepage "https://github.com/cboone/bopca"
  url "https://github.com/cboone/bopca/releases/download/v0.7.0/bopca-darwin-arm64.tar.gz"
  sha256 "ba239a3729d3f8996c39977f90d436c639c7b178c4f22a8e21a9096eb6acf3ce"
  license "MIT"

  depends_on "container"
  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "bopca"
    (share/"bopca").install "Containerfile"
    (share/"bopca/config").install Dir["config/*"]
    generate_completions_from_executable(bin/"bopca", "completion")
    man1.install Dir["man/man1/*"]
  end

  def caveats
    <<~EOS
      Optional: Set up DNS for container hostnames:
        sudo container system dns create test
        container system property set dns.domain test

      Configuration file locations:
        Project: .bopca.yaml or .bopca.yml
        User:    $XDG_CONFIG_HOME/bopca/bopca.yaml or $XDG_CONFIG_HOME/bopca/bopca.yml
                 (default: ~/.config/bopca/bopca.yaml or ~/.config/bopca/bopca.yml)

      Example config: #{share}/bopca/config/bopca.example.yaml
    EOS
  end

  test do
    assert_match "bopca", shell_output("#{bin}/bopca --help")
  end
end
