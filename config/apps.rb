Padrino.configure_apps do
  enable :sessions
  set :session_secret, '<%= ENV["SESSION_SECRET"] %>'
end

Padrino.mount("KanedaNet").to('/')
