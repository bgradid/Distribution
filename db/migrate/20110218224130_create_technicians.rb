class CreateTechnicians < ActiveRecord::Migration
  def self.up
    create_table :technicians do |t|
      t.string :name
      t.string :long_name
      t.integer :recent_count
      t.integer :recent_ram_count
      t.integer :count
      t.integer :ram_count
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :technicians
  end
end
