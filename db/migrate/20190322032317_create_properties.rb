class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.integer :rent, null: false
      t.text :address, null: false
      t.integer :age, null: false
      t.text :remark

      t.timestamps
    end
  end
end
