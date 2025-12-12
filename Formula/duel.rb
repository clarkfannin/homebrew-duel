class Duel < Formula
  desc "CLI 1v1 dueling game"
  homepage "https://github.com/clarkfannin/cli-duel"
  url "https://github.com/clarkfannin/cli-duel/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "859520e0ac22df88da6ad038c7342222f532e81c097f104fbd9fcbeceb66bd3d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"duel", "."
  end

  test do
    assert_match "Usage", shell_output("#{bin}/duel 2>&1", 0)
  end
end
