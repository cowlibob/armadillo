require 'win32/registry'
require 'ffi'

module CodeGen

  @dll_path = nil

  def self.dll_path= dll_path
    @dll_path = dll_path
  end

  def self.dll_path
    if @dll_path
      @dll_path.gsub(/\.dll$/, '')
    else

      sp_path = Win32::Registry::HKEY_LOCAL_MACHINE.open('Software\SoftwarePassport') do |reg|
        reg_typ, reg_val = reg.read('Directory')
        reg_val
      end

      path = sp_path + '\CodeGen\CodeGen'
      if File.exist?( path + '.dll' )
        File.expand_path( path )
      else
        nil
      end
    end
  end

  def self.create_code(version, signature_level, name, key, fingerprint, license_count)
    license_count = license_count.to_i
    
    hardware_id = CodeGen::C::HexToInt(fingerprint)
    extra_info_1 = license_count & 0xffff
    extra_info_2 = license_count >> 16

    puts "signature_level: #{signature_level}, name: #{name}, key: #{key}, hardware_id: #{hardware_id}, extra_info_1: #{extra_info_1}, extra_info_2: #{extra_info_2}"
    code = case version
    when 3
      CodeGen::C::CreateCode3(signature_level, name, key, hardware_id, extra_info_1, extra_info_2, 0, 0, 0)
    end

    code
  end

  module C
    extend FFI::Library
    ffi_lib CodeGen.dll_path
    ffi_convention :stdcall
    
    attach_function :CreateCode, [:string, :string, :ulong, :ushort], :string
    attach_function :CreateCode3, [:int, :string, :string, :ulong, :ushort, :ushort, :ushort, :ushort, :ushort], :string
    attach_function :HexToInt, [:string], :ulong
  end
  
end