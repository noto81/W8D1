class CreatePostSub < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
  end
end
