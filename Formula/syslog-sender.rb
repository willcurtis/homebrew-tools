class SyslogSender < Formula
  desc "Simple random syslog message generator and sender"
  homepage "https://github.com/willcurtis/syslog-sender"
  url "https://github.com/willcurtis/syslog-sender/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "5c4709d05f6f060589bb2c62395ea72e07b0869749ded10983a168cd16c153b9"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "syslog_sender.py" => "syslog-sender"
  end

  test do
    system bin/"syslog-sender", "--help"
  end
end
