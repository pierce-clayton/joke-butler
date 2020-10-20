require_relative '../config/environment'
require_relative '../bin/acquire_joke'


clay = User.create({'name' => 'Clay'}) unless User.find_by(name: 'Clay')
clay = User.all[0]
joke = Joke.new(AcquireJoke.random_joke)
joke2 = joke
# binding.pry
puts '*' * 60
puts clay
joke.save unless Joke.find_by(joke_id: joke['joke_id'])

joke2.save unless Joke.find_by(joke_id: joke['joke_id'])

Message.create({user_id: clay.id, joke_id: joke.id})

puts Joke.all.count
puts User.all.count
puts Message.all
puts '*' * 60
puts clay.jokes
puts joke.users
# binding.pry
# puts AcquireJoke.old_joke(clay)