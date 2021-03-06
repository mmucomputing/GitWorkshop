require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

require_relative 'person.rb'

configure do
  set :haml, {:format => :html5}
  set :scss, {:style => :compact, :debug_info => false}
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

def get_people_from_file(file_name)
  people = []

  File.open(file_name).readlines.each do |line|
    split_line = line.split('|')
    people.push(Person.new(split_line[0], split_line[1]))
  end

  return people
end

get '/' do
  @people = get_people_from_file("people.txt")
  haml :index
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"/sass/#{params[:name]}", Compass.sass_engine_options
end