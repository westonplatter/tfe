class ChangeCategoryToUserCategory < ActiveRecord::Migration
  def change
  	rename_column :keywords, :category, :user_category
  end
end
