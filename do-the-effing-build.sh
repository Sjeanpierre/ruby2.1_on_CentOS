sudo yum install rpm-build redhat-rpm-config rpmdevtools mock
sudo adduser builder --home-dir /home/builder --create-home  --groups mock --shell /bin/bash --comment "rpm package builder"
su - builder
rpmdev-setuptree
cd ~/rpmbuild/SOURCES
wget ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
cp ~/ruby2.1_on_CentOS/ruby21.spec ~/rpmbuild/SPEC/ruby21.spec
cd ~
mock --init
mock --buildsrpm   --spec=./rpmbuild/SPECS/ruby21.spec --sources=./rpmbuild/SOURCES
mock --no-clean --rebuild /var/lib/mock/epel-6-x86_64/result/ruby-2.1.2-1.el6.src.rpm
