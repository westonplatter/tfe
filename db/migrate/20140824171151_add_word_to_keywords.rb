class AddWordToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :word, :string
  end
end
