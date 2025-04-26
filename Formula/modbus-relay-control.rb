class ModbusRelayControl < Formula
  desc "Modbus TCP Relay Board Controller CLI"
  homepage "https://github.com/willcurtis/modbus-relay-control"
  url "https://github.com/willcurtis/modbus-relay-control/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "9a6b299120d9abeb6fe285a1237887d68138018e9476eef42720281b3509eec0"
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
