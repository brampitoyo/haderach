class CreateLinkWords < ActiveRecord::Migration
  def self.up
    create_table :link_words do |t|
      t.integer :link_id
      t.integer :word_id

      t.timestamps
    end
  end

  def self.down
    drop_table :link_words
  end
end
