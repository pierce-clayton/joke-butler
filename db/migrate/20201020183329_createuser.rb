class Createuser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.index :messages
    end
  end
end
