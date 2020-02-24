class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :state
      t.text :description
      t.string :category
      t.string :address
      t.integer :reward
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
