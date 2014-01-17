require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"css/#{params[:name]}" )
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