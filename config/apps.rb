Padrino.configure_apps do
  enable :sessions
  set :session_secret, 'd8e4fbcea45154471ec0eaabe5b5caf01bcc3a245f01f656a80db62425bd2cec'
end

Padrino.mount("KanedaNet").to('/')
