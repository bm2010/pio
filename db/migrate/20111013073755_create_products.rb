class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :manufacturer, :default => 1, :null => false
      t.references :group, :default => 1, :null => false
      t.references :category, :default => 1, :null => false
      t.string :product, :limit => 100,  :null => false
      t.string :info
      t.float :purchase_price
      t.float :sales_price

      t.timestamps
    end
  end
end
