class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :task_done, :boolean
  end
end
