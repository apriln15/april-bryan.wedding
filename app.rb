ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'sinatra/base'
require 'sinatra/asset_pipeline'
require "sinatra/reloader" if development?

class App < Sinatra::Application
  configure do
    # Views
    set :erb, layout_options: { views: 'views/layouts' }
    set :public_folder, './public'

    # Assets
    set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.ico *.svg)
    set :assets_css_compressor, :sass
    set :assets_js_compressor, :uglifier
    set :assets_prefix, %w(assets)
    register Sinatra::AssetPipeline

    if defined?(RailsAssets)
      RailsAssets.load_paths.each do |path|
        settings.sprockets.append_path(path)
      end
    end
  end

  # TODO: Replace this with ERB version
  get '/' do
    erb :index
  end

  # XXX: Fake version of site to test Sinatra out...
  get '/home' do
    erb :home, layout: :application
  end

  # TODO: Implement this...
  post '/message' do
  end
end
