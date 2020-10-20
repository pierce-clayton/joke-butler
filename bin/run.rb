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

def heard_joke?(user, joke)
  !!user.messages.find_by(joke_id: joke.id)
end

clay = User.new({'name' => 'Clay'})
usave(clay)

joke = Joke.new(AcquireJoke.random_joke)
joke2 = joke
joke3 = Joke.new(AcquireJoke.search_joke('elephant'))
puts '*' * 60
jsave(joke)
jsave(joke2)
jsave(joke3)
puts heard_joke?(clay, joke)
puts heard_joke?(clay, joke2)
puts heard_joke?(clay, joke3)
Message.create({user_id: clay.id, joke_id: joke.id})
Message.create({user_id: clay.id, joke_id: joke2.id})
Message.create({user_id: clay.id, joke_id: joke3.id})
# puts clay.messages
puts '*' * 60
# binding.pry
# puts AcquireJoke.old_joke(clay)