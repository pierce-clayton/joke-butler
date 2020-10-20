require_relative '../config/environment'
require_relative '../bin/acquire_joke'



joke = Joke.create(AcquireJoke.random_joke)


puts Joke.all