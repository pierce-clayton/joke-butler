
class AcquireJoke
  URI_BASE = 'https://icanhazdadjoke.com'
  SEARCH = '/search?term='

  def self.random_joke
    resp = RestClient.get(URI_BASE, accept: 'json')
    JSON.parse(resp)
  end
end