class AddRemarksToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :remarks, :text
  end
end
