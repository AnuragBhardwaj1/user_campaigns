class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :tag
      t.string :duration
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
