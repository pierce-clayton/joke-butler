class Createjoke < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes do |column|
      column.string :joke
    end
  end
end
