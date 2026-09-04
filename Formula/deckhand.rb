class Deckhand < Formula
  desc "Turn a folder of HTML slides into a presentation: stage, phone remote, live audience"
  homepage "https://deckhand.stranix.net"
  url "https://github.com/stranix79/deckhand/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "a6ad2d04fa4c837cbe74989d15ac4aed1b1ad2ac1e84bcdc6fc4660faefb41ab"
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
