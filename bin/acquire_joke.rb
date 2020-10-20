
class AcquireJoke
  URI_BASE = 'https://icanhazdadjoke.com'
  SEARCH = '/search?term='

  def self.random_joke
    resp = RestClient.get(URI_BASE, accept: 'json')
    return_hash = JSON.parse(resp)
    # binding.pry
    {:joke => return_hash['joke'], :joke_id => return_hash["id"]}
  end

  def self.search_joke(term)
    resp = RestClient.get(URI_BASE << SEARCH << "#{term}", accept: 'json')
    return_hash = JSON.parse(resp)
    {:joke => return_hash['joke'], :joke_id => return_hash["id"]}
  end
end