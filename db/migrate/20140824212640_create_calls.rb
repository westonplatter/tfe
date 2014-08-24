class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.datetime :call_time
      t.string :number
      t.string :label
      t.string :from_city
      t.string :from_state
      t.decimal :minutes, precision: 10, scale: 4

      t.timestamps
    end
  end
end
