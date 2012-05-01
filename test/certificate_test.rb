require 'minitest/autorun'
require 'armadillo/certificate'

class TestCertificate < MiniTest::Unit::TestCase
  def setup
    CodeGen::dll_path = File.join('c:', 'Program Files', 'SoftwarePassport', 'CodeGen', 'CodeGen.dll')
    @project = Project.new
  end

  def test_version_3_key_generation
    @project.load(File.join('test', 'version3.ARM'))
    @certificate = @project.certificates.first

    key1 = key2 = nil
    log1 = capture_io do
      key1 = @certificate.create_code('Homer Simpson', 10, 'C5B5-F15E')
    end
    refute_nil key1
    refute_empty key1

    log2 = capture_io do
      key2 = @certificate.create_code('Homer Simpson', 10, 'C5B5-F15E')
    end

    assert_equal log1, log2
    refute_equal key1, key2

  end

  def test_version_1_key_generation
    skip
  end

end