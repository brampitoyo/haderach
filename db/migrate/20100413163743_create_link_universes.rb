class CreateLinkUniverses < ActiveRecord::Migration
  def self.up
    create_table :link_universes do |t|
      t.integer :link_id
      t.integer :universe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :link_universes
  end
end
