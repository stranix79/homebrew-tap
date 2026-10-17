class Deckhand < Formula
  desc "Turn a folder of HTML slides into a presentation: stage, phone remote, live audience"
  homepage "https://deckhand.show"
  url "https://github.com/stranix79/deckhand/archive/refs/tags/v1.4.7.tar.gz"
  sha256 "b06457835be91f5837b4c337761ee79d587e6403be3273def36d800ca66cff10"
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
