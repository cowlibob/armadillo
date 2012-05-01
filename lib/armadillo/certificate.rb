require 'armadillo/codegen'

class Certificate
  def initialize project, data
    @project = project
    @name, @data = data
  end

  def name
    @name
  end

  def data
    @data
  end

  def signature_level
    @data['SignatureLevel'].to_i
  end

  def key
    @data['Key']
  end

  def create_code(name, license_count = nil, fingerprint = nil)
    
    code = nil
    case @project.version
    when 100
      code = '100'
    when 300
      code = CodeGen.create_code(3, signature_level, name, key, fingerprint, license_count)
      #key = CodeGen::C::CreateCode3(signature_level, name, key, hardware_id, extra_info_1, extra_info_2, 0, 0, 0)
    else
      raise "Unhandled certificate version (#{version})"
    end
    code
  end

end