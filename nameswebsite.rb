require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

configure do
  set :haml, {:format => :html5}
  set :scss, {:style => :compact, :debug_info => false}
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"/sass/#{params[:name]}", Compass.sass_engine_options
end

get '/' do
	@names = get_names()
	haml :index
end

def get_names()
	names = []
	File.open("names.txt").readlines.each do |line|
		names.push(line)
	end
end