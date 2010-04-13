class CreateUniverses < ActiveRecord::Migration
  def self.up
    create_table :universes do |t|
      t.string :name, :null => false
      t.string :website
      t.text :description
      t.integer :genre_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :universes
  end
end
