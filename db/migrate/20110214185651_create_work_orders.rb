class CreateWorkOrders < ActiveRecord::Migration
  def self.up
    create_table :work_orders do |t|
      t.integer :number
      t.boolean :assigned
      t.boolean :ramupgrade
      t.string :details
      t.string :technician

      t.timestamps
    end
  end

  def self.down
    drop_table :work_orders
  end
end
