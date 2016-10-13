class CreateComponentAttachments < ActiveRecord::Migration
  def change
    create_table :component_attachments do |t|
      t.string :attachment
      t.references :component, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
