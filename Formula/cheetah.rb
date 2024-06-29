class Cheetah < Formula
  desc "Fast and simple SSG written in Rust, with hydration and shadow DOM"
  homepage "https://cheetah.farthergate.com/"
  url "https://github.com/aleksrutins/cheetah/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "e58a72bd95b7b23bee01616769d6185b87d4dea436c1632c71f40489945f2ac7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"pages"/"index.md").write('
	# Hello World
    ')

    system bin/"cheetah"

    assert_predicate testpath/"_build"/"pages"/"index.html", :exist?
  end
end
