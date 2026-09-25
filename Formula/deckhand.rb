class Deckhand < Formula
  desc "Turn a folder of HTML slides into a presentation: stage, phone remote, live audience"
  homepage "https://deckhand.show"
  url "https://github.com/stranix79/deckhand/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "bc61946c98bccb182441d0b589a06f3c1bdc3b3285bf92186ad961235d6b7e2d"
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
