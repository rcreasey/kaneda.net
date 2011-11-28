class KanedaNet < Padrino::Application
  register ScssInitializer
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  enable :sessions
  enable :caching
  
  layout :application
  
  configure :production do
    set :cache, Padrino::Cache::Store::Memcache.new( ::Dalli::Client.new )

    ENV['APP_ROOT'] ||= File.dirname(__FILE__)
    $:.unshift "#{ENV['APP_ROOT']}/vendor/plugins/newrelic_rpm/lib"
    require 'newrelic_rpm'
  end
  
  error 404, :provides => [:html] do
    render 'errors/404'
  end
  
  get :index, :provides => [:html] do
    render 'prompt/index'
  end
  
  get :about, :provides => [:html], :cache => true do
    render 'prompt/about'
  end
  
  get '/files/ryan.creasey.pdf' do
    redirect 'http://www.linkedin.com/in/ryancreasey'
  end
end
