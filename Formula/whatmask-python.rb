class WhatmaskPython < Formula
  desc "A Python recreation of the classic whatmask tool"
  homepage "https://github.com/willcurtis/whatmask-python"
  url "https://github.com/willcurtis/whatmask-python/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "51fb2f803b03194bc84166c2d0548e5d8b68fe742463ce04ab6182f27768f4c3"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "getmask.py" => "getmask"
  end

  test do
    system bin/"getmask", "--help"
  end
end
