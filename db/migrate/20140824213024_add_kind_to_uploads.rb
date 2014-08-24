class AddKindToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :kind, :string
  end
end
