set :application, "kaneda.net"
set :repository,  "svn://svn.evilcode.net/sites/kaneda.net/trunk"
set :deploy_to, "/z/www/#{application}"
set :user, "ryan"
set :svn_user, "ryan"
set :svn_password, "svnpass4u"

role :app, "rails01.infernalhosting.net"
role :web, "rails01.infernalhosting.net"
role :db,  "rails01.infernalhosting.net", :primary => true

set :mongrel_conf, "#{current_path}/config/mongrel_production.yml"
