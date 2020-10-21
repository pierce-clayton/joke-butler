require_relative '../config/environment'
require_relative '../bin/acquire_joke'
require_relative '../bin/joke_hash'



clay = User.create({'name' => 'Clay'})
# clay = User.all[1]

100.times do |time|
  joke = Joke.create(random_joke)
  msg = Message.create({user_id: clay.id, joke_id: joke.id})
  puts msg.joke.joke
  puts time
  sleep(0.7)
end
puts '*' * 60
clay.destroy
# binding.pry
# puts AcquireJoke.old_joke(clay)