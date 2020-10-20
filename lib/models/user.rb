class User < ActiveRecord::Base
  has_many :messages
  has_many :jokes, through: :messages

  def old_joke
    jokes.shuffle.sample
  end

  def heard_joke?(joke)
    !!messages.find_by(joke_id: joke.id)
  end

  def create_message(joke)
    Message.create({user_id: id, joke_id: joke.id})
  end
end