class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
