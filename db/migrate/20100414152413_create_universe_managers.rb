class CreateUniverseManagers < ActiveRecord::Migration
  def self.up
    create_table :universe_managers do |t|
      t.integer :manager_id
      t.integer :universe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :universe_managers
  end
end
