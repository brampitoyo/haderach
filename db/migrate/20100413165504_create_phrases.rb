class CreatePhrases < ActiveRecord::Migration
  def self.up
    create_table :phrases do |t|
      t.string :phrase, :null => false
      t.string :definition
      t.integer :universe_id, :null => false
      t.string :website
      t.boolean :titleize

      t.timestamps
    end
  end

  def self.down
    drop_table :phrases
  end
end
