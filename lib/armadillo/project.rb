require 'armadillo/certificate'

require 'inifile'

class Project

  def initialize
  end

  def load( project_path )
    @data = IniFile::load( project_path )
  end

  def certificates
    re = /Project#Certificate\d$/
    certs = @data.match( re ).collect{ |cert_data| Certificate.new(self, cert_data) }
    return certs 
  end

  def version
    @data['Project']['Version'].to_i
  end

end
