class Createmessage < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :user_id
      t.text :joke_id
    end
  end
end
