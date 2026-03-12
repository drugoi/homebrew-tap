# typed: false
# frozen_string_literal: true

class Diddo < Formula
  desc "Track your git commits, get AI-powered daily summaries"
  homepage "https://github.com/drugoi/diddo-hooks"
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3efd432ce1655d81eaddc502dca71cd875af3d308be36c2992547bf8c39cfd25"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "212facfec8568cd13c5686518fa1efc86098262c5f63f1212e5b7ea707cd7828"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e44ee81aa0e2d1615b91ee384c2b4241ab018a08fa3130c7f7f48c92096f3880"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "445670d6e2b9aa1831f1325188e8c8e53e142725c2e80a16c8477f9f26d536e7"
    end
  end

  def install
    bin.install "diddo"
  end

  test do
    assert_match "diddo", shell_output("#{bin}/diddo --help")
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end
end
