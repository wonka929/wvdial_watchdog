#!/bin/bash
echo "Installing UFW, denying all inbound services excluding ssh and allowing all outbound"
sudo apt-get install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw enable

echo "Installing Packages"
sudo apt-get install -y mysql-server subversion git ncftp rar p7zip-full iw ethtool dos2unix gtk-recordmydesktop postgresql
sudo apt-get install -y sqlite3 nbtscan dsniff libncurses-dev libpcap-dev libssl-dev hping3 openssh-server ruby-dev
sudo apt-get install -y python-dev autoconf open-iscsi wireshark isc-dhcp-server locate libusb-dev g++ arp-scan cewl
sudo apt-get install -y webhttrack finger rusers snmp reglookup gpsd libgps-dev apache2 libnet-ssh-perl kismet libnl-route-3-dev
sudo apt-get install -y curl sslscan libpq-dev libxml2-dev vim python-setuptools libmicrohttpd-dev horst kismet-plugins
sudo apt-get install -y python-nltk python-soappy python-lxml python-svn python-scapy gtk2-engines-pixbuf graphviz python-gtksourceview2
sudo apt-get install -y libssh-dev libmysqlclient-dev libpcre3-dev firebird-dev libsvn-dev libidn11-dev libcurl4-gnutls-dev
sudo apt-get install -y libxslt1-dev sipcrack libgmp3-dev python-mysqldb libnet1-dev flasm registry-tools python-pygraphviz
sudo apt-get install -y libavahi-compat-libdnssd-dev gip ldap-utils bkhive ophcrack macchanger flamerobin dsniff sipsak libnetfilter-queue-dev
sudo apt-get install -y ike-scan nfs-kernel-server httping ptunnel libaspell-dev autoconf libpcap-dev libnl-genl-3-200
sudo apt-get install -y libyaml-dev default-jdk libreadline-dev python-pip python-beautifulsoup tshark libnl-genl-3-dev libnl-idiag-3-dev
sudo apt-get install -y samba ldapscripts python-smbpasswd libevent-dev flex bison libgeoip-dev chntpw openconnect libffi-dev
sudo apt-get install -y libnetfilter-conntrack-dev libncurses-dev liburcu-dev libnacl-dev zlib1g-dev libcli-dev python-pycurl vpnc
sudo apt-get install -y ptunnel iodine udptunnel httptunnel netmask dnstracer dnswalk swig cmake libtalloc-dev libtevent-dev libpopt-dev
sudo apt-get install -y libbsd-dev unixodbc unixodbc-dev freetds-dev sqsh tdsodbc autofs remmina remmina-plugin-rdp remmina-plugin-vnc
sudo apt-get install -y squid python-libpcap ntpdate screen samba-common-bin upx whois libreadline-gplv2-dev gcc-mingw-w64-x86-64
sudo apt-get install -y gcc-mingw-w64-i686 libsqlite3-dev tftp tftpd libfreerdp-dev libssh2-1-dev python-elixir python-pyasn1
sudo apt-get install -y python3-pip secure-delete

#wine wine-dev

sudo update-rc.d -f mysql remove && sudo update-rc.d -f apache2 remove
sudo update-rc.d -f cups remove && sudo update-rc.d -f cups-browsed remove

if [ ! -f /usr/local/bin/cpanm ] ; then
echo "Installing CPANimus"
cd /pentest/temp && git clone https://github.com/miyagawa/cpanminus.git
cd cpanminus && perl Makefile.PL
make && sudo make install
cd /pentest/temp && rm -rf cpanminus/
fi

echo "Checking and Installing PERL Deps"
sudo cpanm Cisco::CopyConfig && sudo cpanm Net::Telnet
sudo cpanm Net::Netmask && sudo cpanm XML::Writer
sudo cpanm Encoding::BER && sudo cpanm Term::ANSIColor	
sudo cpanm Getopt::Long && sudo cpanm XML::Writer
sudo cpanm Socket && sudo cpanm Net::Whois::IP
sudo cpanm Number::Bytes::Human && sudo cpanm Parallel::ForkManager
sudo cpanm NetPacket::ICMP && sudo cpanm String::Random
sudo cpanm LWP::UserAgent && sudo cpanm Object::InsideOut
sudo cpanm  Test::Class && sudo cpanm WWW::Mechanize
sudo cpanm Net::Whois::ARIN && sudo cpanm Test::MockObject
sudo cpanm Template && sudo cpanm Net::CIDR
sudo cpanm JSON && sudo cpanm Color::Output
sudo cpanm Net::IP

echo "Installing Python Deps"
sudo pip uninstall pyasn1
sudo pip install esmre pdfminer futures guess-language cluster msgpack-python python-ntlm clamd xdot
sudo pip install lxml netaddr M2Crypto cherrypy mako M2Crypto dnspython requests capstone dicttoxml
sudo pip install PyGithub GitPython pybloomfiltermmap esmre pdfminer futures guess-language 
sudo pip install cluster msgpack-python python-ntlm clamd xdot netifaces pyinstaller wfuzz
sudo pip install -e git+https://github.com/ramen/phply.git#egg=phply
sudo pip install pbkdf2 pymongo ipcalc couchdb dicttoxml PyPDF2 olefile pyasn1 crackmapexec
sudo pip3 install xcat

echo "Checking and Installing Ruby Gems"
sudo gem install bundler spider http_configuration mini_exiftool zip sqlite3 net-dns bettercap
