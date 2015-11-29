class ReplacePostContentWithDescriptionAndLocation < ActiveRecord::Migration
  def change
    add_column :posts, :description, :string
    add_column :posts, :explanation, :string
    add_column :posts, :location, :string
    remove_column :posts, :content, :string
    remove_column :posts, :contact, :string
  end
end
