class Duel < Formula
  desc "CLI 1v1 dueling game"
  homepage "https://github.com/clarkfannin/cli-duel"
  url "https://github.com/clarkfannin/cli-duel/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "cd27773408a179634b66c91afcb5c3c286635a730b25e04144b3c47f1d8265a3"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"duel", "."
  end

  test do
    assert_match "duel", shell_output("#{bin}/duel help 2>&1", 0)
  end
end
