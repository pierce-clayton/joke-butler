require_relative '../config/environment'
require_relative '../bin/acquire_joke'

def jsave(joke)
  joke.save unless Joke.find_by(joke_id: joke['joke_id'])
  joke
end

def usave(user)
  user.save unless User.find_by(name: user['name'])
  user
end


def random_joke
  Joke.new(AcquireJoke.random_joke)
end
clay = User.new({'name' => 'Clay'})
usave(clay)

joke = random_joke

def tmaj(user, joke)
  if user.heard_joke?(joke)
    tmaj(user, random_joke)
  else
    joke = jsave(joke)
    message = user.create_message(joke)
    puts message.joke.joke
  end

end
tmaj(clay, joke)
puts '*' * 60
# binding.pry
# puts AcquireJoke.old_joke(clay)