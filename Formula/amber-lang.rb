class AmberLang < Formula
  desc "Amber, the programming language that compiles to Bash"
  homepage "https://amber-lang.com"
  url "https://github.com/Ph0enixKM/Amber/releases/download/0.3.3-alpha/source.tar.gz"
  sha256 "54a4f681f8ea1b19543ffa1569203c3bff88ef8ffe73422424f65f8be3cf5cd0"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Amber programs need Bash to run. macOS and most Linux distributions ship with it preinstalled, but some (Alpine, for instance) do not.

      In order to run built programs, please make sure you have Bash installed.
    EOS
  end

  test do
    (testpath/"main.ab").write('
	let name = "World"
	echo "Hello, {name}"
    ')

    assert_equal "Hello, World", shell_output("#{bin}/amber main.ab").strip
  end
end
