require 'minitest/autorun'
require 'armadillo/project'

class TestProject < MiniTest::Unit::TestCase

  def setup
    @project = Project.new
    @project.load(File.join('test', 'version3.ARM'))
  end

  def test_project_loaded
    assert_equal 1, @project.certificates.count
    cert = @project.certificates.first
    assert_kind_of Certificate, cert
    assert_equal 'Example', cert.data['Name']
  end

  def test_project_version
    assert_equal 300, @project.version
  end
end