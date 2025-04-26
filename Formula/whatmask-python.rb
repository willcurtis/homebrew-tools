class WhatmaskPython < Formula
  desc "A Python recreation of the classic whatmask tool"
  homepage "https://github.com/willcurtis/whatmask-python"
  url "https://github.com/willcurtis/whatmask-python/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4cfa78a89dbc25644923011827aa831ffe1a6f96bea332b7ee44ec542ccf026a"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "getmask.py" => "getmask"
  end

  test do
    system bin/"getmask", "--help"
  end
end
