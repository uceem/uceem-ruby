require 'rubygems'
require 'sinatra'
require 'glorify'

set :erb, format: :html5
set :markdown, layout_engine: :erb, layout: :layout

Tilt.prefer(Sinatra::Glorify::Template)

get '/' do
  markdown(:index)
end

get '/authentication' do
  markdown(:authentication)
end