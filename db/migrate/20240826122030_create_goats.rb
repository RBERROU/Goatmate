class CreateGoats < ActiveRecord::Migration[7.1]
  def change
    create_table :goats do |t|
      t.string :name
      t.text :bio
      t.decimal :price_per_day
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
