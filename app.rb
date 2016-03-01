ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])


class App < Sinatra::Application
  get '/' do
    send_file 'views/index.html'
  end
end
