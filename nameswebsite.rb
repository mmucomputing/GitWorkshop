require 'rubygems'
require 'sinatra'
require 'Haml'

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