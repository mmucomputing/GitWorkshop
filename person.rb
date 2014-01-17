require 'gravatar-ultimate'

class Person
  attr_reader :name, :avatar

  def initialize(name, email)
    @name = name
    @avatar = Gravatar.new(email).image_url
  end
end