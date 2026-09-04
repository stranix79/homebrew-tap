class Deckhand < Formula
  desc "Turn a folder of HTML slides into a presentation: stage, phone remote, live audience"
  homepage "https://deckhand.stranix.net"
  url "https://github.com/stranix79/deckhand/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "a7bd492746d8bca8873287007b9d1a972cf8e9e62d496ffc2f1a135c90b8d281"
  license "MIT"
  head "https://github.com/stranix79/deckhand.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/stranix79/deckhand/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/deckhand"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deckhand version")
  end
end
