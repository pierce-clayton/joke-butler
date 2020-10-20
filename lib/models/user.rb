class User < ActiveRecord::Base
  has_many :messages
  has_many :jokes, through: :messages

  def old_joke
    jokes.shuffle.sample
  end
end