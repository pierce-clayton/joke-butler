class Joke < ActiveRecord::Base
  has_many :messages
  has_many :users, through: :messages

  ICAN = 'https://icanhazdadjoke.com'
  ICSEARCH = '/search?term='

  def self.random_joke
    resp = RestClient.get(ICAN, accept: 'json')
    return_hash = JSON.parse(resp)
    random_joke unless return_hash['status'] == 200
    binding.pry
    joke = create({ joke: return_hash['joke'], joke_id: return_hash['id'] }) unless find_by(joke_id: joke['joke_id'])
    joke.nil? ? random_joke : joke
  end

  def self.search_joke(term)
    resp = RestClient.get(ICAN << ICSEARCH << term.to_s, accept: 'json')
    return_hash = JSON.parse(resp)
    search_joke unless return_hash['status'] == 200
    joke = create({ joke: return_hash['joke'], joke_id: return_hash['id'] }) unless find_by(joke_id: joke['joke_id'])
    joke.nil? ? search_joke(term) : joke
  end
end
