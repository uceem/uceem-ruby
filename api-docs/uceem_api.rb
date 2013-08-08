require 'rubygems'
require 'sinatra'
require 'glorify'
require 'sass'
require 'compass'

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

get '/accounts' do
  markdown(:accounts)
end

get '/users' do
  markdown(:users)
end

get '/routers' do
  markdown(:routers)
end

get '/clients' do
  markdown(:clients)
end

get '/activities' do
  markdown(:activities)
end

get '/all.css' do
  content_type 'text/css', charset: 'utf-8'
  scss(:'../public/scss/all')
end
