class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.references :manufacturer, :default => 1

      t.timestamps
    end
  end
end
