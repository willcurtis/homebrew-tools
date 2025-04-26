class MacLookupTool < Formula
  desc "CLI tool to look up MAC Address Vendors"
  homepage "https://github.com/willcurtis/mac-lookup-tool"
  url "https://github.com/willcurtis/mac-lookup-tool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9f17df1b5456306d06454a16f905ba5cb81b74a48b43a2a913e85bab43079bfd"
  license "MIT"

  def install
    bin.install "mac_lookup.sh" => "mac-lookup"
  end

  test do
    system "#{bin}/mac-lookup", "00:11:22:33:44:55"
  end
end
