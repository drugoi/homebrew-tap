# typed: false
# frozen_string_literal: true

class Diddo < Formula
  desc "Track your git commits, get AI-powered daily summaries"
  homepage "https://github.com/drugoi/diddo-hooks"
  version "0.6.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bff87e9c4580c84bde7a459a4d009bdca6b69177ce4accf0b36bc45f50d632a7"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b1b28b37f44707be15c14d16658f29e641f013cd00e5255f95bfce175c426588"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4c4687537e079c2212f693ff8e9c38fadb331a53098392e2a51d2ccb1897901"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39040e0c5b0cfffd00be6f5fea609163dd42c53732322b8cf295342bd1fdca1d"
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
