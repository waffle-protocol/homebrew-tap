class Waffle < Formula
  desc "P2P LLM Token Marketplace CLI"
  homepage "https://github.com/waffle-protocol/waffle-studio"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/waffle-protocol/waffle-studio/releases/download/v0.1.0/waffle-darwin-arm64.tar.gz"
      sha256 "0271472b055ece2cd4656999b81c5df337c2864057ea0a538a5e96de96f7c01f"
    else
      url "https://github.com/waffle-protocol/waffle-studio/releases/download/v0.1.0/waffle-darwin-amd64.tar.gz"
      sha256 "ef3d6ec31e97c2465fc1bd1a466d0f5236a854af522dfbfc5e4f6ca4c5873da6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/waffle-protocol/waffle-studio/releases/download/v0.1.0/waffle-linux-amd64.tar.gz"
      sha256 "e6edff7b635d4c19f200e2ec44fb6c1df9e13d1e1f0bf9020ea63735602bf39e"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "waffle-darwin-arm64" => "waffle"
    elsif OS.mac?
      bin.install "waffle-darwin-amd64" => "waffle"
    else
      bin.install "waffle-linux-amd64" => "waffle"
    end
  end

  test do
    system "#{bin}/waffle", "--help"
  end
end
