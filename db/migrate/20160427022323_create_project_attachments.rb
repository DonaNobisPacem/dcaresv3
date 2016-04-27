class CreateProjectAttachments < ActiveRecord::Migration
  def change
    create_table :project_attachments do |t|
      t.string :attachment
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
