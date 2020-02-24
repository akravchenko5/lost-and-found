class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.references :keeper, null: false, foreign_key: {to_table: :users}
      t.references :seeker, null: false, foreign_key: {to_table: :users}
      t.references :item, null: false, foreign_key: true
      # t.integer 'keeper_id', null: false
      # t.integer 'seeker_id', null: false
      t.timestamps
    end
  end
end
