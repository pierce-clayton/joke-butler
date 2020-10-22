ICAN = 'https://icanhazdadjoke.com'
ICSEARCH = '/search?term='

def random_joke
  resp = RestClient.get(ICAN, accept: 'json')
  return_hash = JSON.parse(resp)
  random_joke unless return_hash['status'] == 200
  { joke: return_hash['joke'], joke_id: return_hash['id'] }
end
