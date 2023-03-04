class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :title
      t.string :body
      t.string :profile_image_id
      t.integer :user_id
      t.timestamps
    end
  end
end
