require 'minitest/autorun'
require 'win32/dir'
require 'armadillo/codegen'

class TestCodeGen < MiniTest::Unit::TestCase

  def test_that_codegen_can_find_dll
    usual_path = File.expand_path(File.join(Dir::PROGRAM_FILES, 'SoftwarePassport', 'CodeGen', 'CodeGen'))
    assert_equal usual_path.downcase, CodeGen.dll_path.downcase
  end

  def test_that_codegen_can_load_dll
    assert_equal 255, CodeGen::C::HexToInt('ff')
    assert_equal 3735928559, CodeGen::C::HexToInt('DEADBEEF')
  end
  
end