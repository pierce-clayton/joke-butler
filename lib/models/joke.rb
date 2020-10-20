class Joke < ActiveRecord::Base
  has_many :users, through: :messages
end