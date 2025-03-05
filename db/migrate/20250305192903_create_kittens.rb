class CreateKittens < ActiveRecord::Migration[8.0]
  def change
    create_table :kittens do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.float :cuteness, null: false
      t.float :softness, null: false
      t.timestamps
    end
  end
end
