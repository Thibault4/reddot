class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :parent_comment, null: true, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
