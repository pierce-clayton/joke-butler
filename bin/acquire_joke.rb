
class AcquireJoke
  URI_BASE = 'https://icanhazdadjoke.com'
  SEARCH = '/search?term='

  def self.random_joke
    resp = RestClient.get(URI_BASE, accept: 'json')
    return_hash = JSON.parse(resp)
    # binding.pry
    {:joke => return_hash['joke'], :joke_id => return_hash["id"]}
  end

  def self.old_joke(user)
    Joke.all.shuffle.each do |joke|
      return joke if user.jokes.any?(joke)
    end
  end
end