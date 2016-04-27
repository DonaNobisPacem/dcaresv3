class CreateProjectFunds < ActiveRecord::Migration
  def change
    create_table :project_funds do |t|
      t.integer :source
      t.decimal :amount, precision: 15, scale: 2
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
