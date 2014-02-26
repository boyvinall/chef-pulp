name             'pulp'
maintainer       'Marius Karnauskas'
maintainer_email 'marius@karnauskas.lt'
license          'Apache 2.0'
description      'Installs/Configures pulp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{centos}.each do |os|
    supports os
end

depends 'yum'
