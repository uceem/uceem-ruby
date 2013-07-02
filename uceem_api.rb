require 'rubygems'
require 'sinatra'

set :erb, format: :html5
set :markdown, layout_engine: :erb, layout: false

get '/' do
  markdown :index
end