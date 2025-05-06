# Formula for config-generator-j2
class ConfigGeneratorJ2 < Formula
  include Language::Python::Virtualenv

  desc "Bulk-generate network device configs from Jinja2 templates and CSV"
  homepage "https://github.com/willcurtis/configuration-generator"
  url "https://github.com/willcurtis/configuration-generator/archive/v1.0.0.tar.gz"
  sha256 "fca5918300b2b6dbeaeba70a8e220d4a4dfec2321fcbf83d4fd28819cf6c131d"
  license "MIT"

  depends_on "python@3.11"

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.1.2.tar.gz"
    sha256 "6fc11f3e57e7dc71dc1b56e07189c871fcd9f063cfe6f0dd926d2fb559ede4ed"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/config_generator_jinja2.py" => "config-generator-j2"
  end

  test do
    # Verify help output
    assert_match "usage: config-generator-j2", shell_output("#{bin}/config-generator-j2 -h")

    # Minimal template & CSV smoke-test
    (testpath/"templates").mkpath
    (testpath/"templates/test.j2").write <<~EOS
      hostname {{ hostname }}
    EOS
    (testpath/"devices.csv").write <<~EOS
      hostname
      testbox
    EOS

    system "#{bin}/config-generator-j2",
           "--template-dir", "templates",
           "--template-file", "test.j2",
           "--csv", "devices.csv",
           "--output", "out"
    assert_predicate testpath/"out/testbox.cfg", :exist?
    assert_match "hostname testbox", (testpath/"out/testbox.cfg").read
  end
end
