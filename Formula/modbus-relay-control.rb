class ModbusRelayControl < Formula
  desc "Modbus TCP Relay Board Controller CLI"
  homepage "https://github.com/willcurtis/modbus-relay-control"
  url "https://github.com/willcurtis/modbus-relay-control/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "2c49cbc130eded2eed01bfc9e2c62917214c3a230ae254a2298d9a0748762562"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "modbus_relay_cli.py" => "modbus-relay"
  end

  def caveats
    <<~EOS
      Installed as 'modbus-relay' command.
      
      Example usage:
        modbus-relay --ip 10.0.0.1 --status
    EOS
  end

  test do
    system "#{bin}/modbus-relay", "--help"
  end
end
