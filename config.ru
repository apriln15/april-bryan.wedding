require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'sinatra/base'
require "sinatra/reloader" if development?

# Main App
require './app'


map '/' do
  run App.new
end
