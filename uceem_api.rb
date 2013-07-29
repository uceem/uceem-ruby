require 'rubygems'
require 'sinatra'
require 'glorify'
require 'sass'
require 'compass'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'sass'
  end

  set :scss, Compass.sass_engine_options
end

set :erb, format: :html5
set :markdown, layout_engine: :erb, layout: :layout

Tilt.prefer(Sinatra::Glorify::Template)

get '/' do
  markdown(:introduction)
end

get '/introduction' do
  markdown(:introduction)
end

get '/authentication' do
  markdown(:authentication)
end

get '' do
  markdown(:users)
end