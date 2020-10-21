require 'rest-client'
require 'json'
require 'pry'


class Joke

  attr_reader :joke_id, :joke
  def initialize(attrs = {})
    @joke_id = attrs['id']
    @joke = attrs['joke']
  end

  def self.retrieve_joke
    resp = RestClient.get('https://icanhazdadjoke.com', accept: 'json')
    JSON.parse(resp)
    # binding.pry
  end

  def self.retrieve_joke_search(search_item)
    resp = RestClient.get("https://icanhazdadjoke.com/search?term=#{search_item}", accept: 'json')
    JSON.parse(resp)
  end
end
binding.pry
