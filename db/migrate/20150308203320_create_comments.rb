class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :attributes=primary_keys,timestamps

      t.timestamps null: false
    end
  end
end
