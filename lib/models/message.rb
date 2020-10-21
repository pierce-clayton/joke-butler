class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :joke

  def initialize(*args)
    super(*args)
    deliver_joke
  end

  def deliver_joke
    puts joke.joke
  rescue NoMethodError
    # joke = user.jokes.sample
    joke = AcquireJoke.random_joke
    puts joke.joke
    # binding.pry

  end
end