class KanedaNet < Padrino::Application
  register ScssInitializer
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  enable :sessions
  enable :caching
  
  set :cache, Padrino::Cache::Store::Memcache.new( ::Dalli::Client.new )
  
  layout :application
  
  error 404, :provides => [:html] do
    render 'errors/404'
  end
  
  get :index, :provides => [:html] do
    render 'prompt/index'
  end
  
  get :about, :provides => [:html] do
    render 'prompt/about'
  end
end
