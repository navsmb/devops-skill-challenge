class CreateBoolios < ActiveRecord::Migration
  def change
    create_table :boolios do |t|
      t.boolean :val
      t.string :api_id

      t.timestamps null: false
    end
  end
end
