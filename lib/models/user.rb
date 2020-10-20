class User < ActiveRecord::Base
  has_many :jokes, through: :messages
end