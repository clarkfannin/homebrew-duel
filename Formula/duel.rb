class Duel < Formula
  desc "CLI 1v1 dueling game"
  homepage "https://github.com/clarkfannin/cli-duel"
  url "https://github.com/clarkfannin/cli-duel/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "54b14fe6b86a95557236d7353899a54c9bcc8952aceb384f70fa76c6614a250c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"duel", "."
  end

  test do
    assert_match "duel", shell_output("#{bin}/duel help 2>&1", 0)
  end
end
