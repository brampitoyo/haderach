class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :word, :null => false
      t.string :definition
      t.integer :universe_id, :null => false
      t.string :website
      t.boolean :is_name, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end
