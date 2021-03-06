class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :commentable_id
      t.string  :commentable_type
      t.integer :user_id, index: true

      t.timestamps null: false

    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
