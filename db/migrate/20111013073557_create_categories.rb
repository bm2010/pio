class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.references :manufacturer, :default => 1

      t.timestamps
    end
  end
end
