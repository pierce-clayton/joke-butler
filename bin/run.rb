require_relative '../config/environment'
require_relative '../bin/acquire_joke'



joke = Joke.new(AcquireJoke.random_joke)
joke2 = joke
# binding.pry

joke.save unless Joke.find_by(joke_id: joke['joke_id'])

joke2.save unless Joke.find_by(joke_id: joke['joke_id'])

puts Joke.all.count