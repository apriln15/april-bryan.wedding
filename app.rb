ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'sinatra/base'
require 'sinatra/asset_pipeline'
require "sinatra/reloader" if development?
require "autoprefixer-rails"

PARTIALS = [
  'sections/_story',
  'sections/_ceremony',
  'sections/_reception',
  'sections/_wedding_party',
  'sections/_hotels',
  'sections/_entertainment'
].map(&:to_sym).freeze

class App < Sinatra::Application
  configure do
    # Views
    set :haml, layout_options: { views: 'views/layouts' }
    set :public_folder, './public'

    # Assets
    set :sprockets, Sprockets::Environment.new
    set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.ico *.svg)
    set :assets_css_compressor, :sass
    set :assets_js_compressor, :uglifier
    set :assets_prefix, %w(assets)
    register Sinatra::AssetPipeline

    AutoprefixerRails.install(sprockets)

    if defined?(RailsAssets)
      RailsAssets.load_paths.each do |path|
        settings.sprockets.append_path(path)
      end
    end
  end

  get '/' do
    haml :index, layout: :application
  end
end
