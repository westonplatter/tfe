class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.integer :age
      t.string :sex
      t.string :category
      t.integer :download_id

      t.timestamps
    end
  end
end
