class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :joke

  def initialize(*args)
    super(*args)
    deliver_joke
  end

  def deliver_joke
    puts self.joke.joke
  end
end