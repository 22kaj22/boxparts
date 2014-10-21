module Autoparts
  module Packages
    class Fwtools < Package
      name 'fwtools'
      version '2.0.6'
      description 'FWTools: FWTools is a set of Open Source GIS binaries, incl GDAL, for 32bit Linux'
      category Category::LIBRARIES

      source_url 'http://fwtools.loskot.net/FWTools-linux-2.0.6.tar.gz'
      source_sha1 '3bcc71aa9cb983681fa5025084685d6631b6cfa0'
      source_filetype 'tar.gz'
      
      #prefix_path 'fwtools/2.0.6'
      
      def install
        Dir.chdir('FWTools-2.0.6') do
          execute './install.sh'
        end
        
        prefix_path.mkpath
        FileUtils.cp_r 'FWTools-2.0.6/.', prefix_path
        FileUtils.rm_rf 'FWTools-2.0.6/.'
        
      end
            
      def required_env
				[
          'export PATH="$PATH:$HOME/.parts/packages/fwtools/2.0.6/bin_safe/"',
          'export PYTHONPATH="$PYTHONPATH:$HOME/.parts/packages/fwtools/2.0.6/pymod/"',   
        ]
      end    
      
    end
  end
end
