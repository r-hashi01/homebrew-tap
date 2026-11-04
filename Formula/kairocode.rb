# Made by scripts/release-build.sh for v0.1.0: put it in the tap
# (Formula/kairocode.rb of r-hashi01/homebrew-tap).
class Kairocode < Formula
  desc "Coding agent whose sessions survive crashes, long waits and running side by side"
  homepage "https://github.com/r-hashi01/kairocode"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/r-hashi01/kairocode/releases/download/v0.1.0/kairocode_0.1.0_darwin_arm64.tar.gz"
      sha256 "e190b1ffdaa82b31a9f57c63e406d96a9aa73365b375a1a1143fab133e7a03e6"
    end
    on_intel do
      url "https://github.com/r-hashi01/kairocode/releases/download/v0.1.0/kairocode_0.1.0_darwin_amd64.tar.gz"
      sha256 "77debc9b24382c9f7ce1cb98b41149e93a818ec2ee6f107b5b7493e10749156d"
    end
  end

  on_linux do
    depends_on "bubblewrap" # its sandbox (ADR 0005)
    on_arm do
      url "https://github.com/r-hashi01/kairocode/releases/download/v0.1.0/kairocode_0.1.0_linux_arm64.tar.gz"
      sha256 "3b7358769de9a2dee32cfbe66a5c7bbe4961b6a6f623f4289e9cc5ae261c7c93"
    end
    on_intel do
      url "https://github.com/r-hashi01/kairocode/releases/download/v0.1.0/kairocode_0.1.0_linux_amd64.tar.gz"
      sha256 "ec4c66fb9155e9596c7ccde8146867119a64ac900d4e91fcc2eb851f96fbbc53"
    end
  end

  def install
    bin.install "kairocode"
    bin.install_symlink "kairocode" => "kairo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kairocode version")
  end
end
