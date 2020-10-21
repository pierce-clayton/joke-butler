require_relative '../config/environment'
require_relative '../bin/acquire_joke'



clay = User.create({'name' => 'Clay'})
# clay = User.all[1]

100.times do |time|
  clay.create_message(AcquireJoke.random_joke)
  puts time
  sleep(0.7)
end
puts '*' * 60
clay.destroy
# binding.pry
# puts AcquireJoke.old_joke(clay)