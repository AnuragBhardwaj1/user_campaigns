class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email, index: true
      t.string :password_digest, limit: 40
      t.integer :role , default: 0, null: false, index: true
      t.integer :status, default: 0,null: false, index: true
      t.string :profession
      t.string :service

      t.timestamps null: false
    end
  end
end
