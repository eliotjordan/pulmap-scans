git clone https://github.com/eliotjordan/pulmap-scans.git
cd pulmap-scans/
cp config/database.yml.tmpl config/database.yml
bundle install
rails s -e production -b 0.0.0.0