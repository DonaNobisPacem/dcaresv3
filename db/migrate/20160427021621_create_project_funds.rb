class CreateProjectFunds < ActiveRecord::Migration
  def change
    create_table :project_funds do |t|
      t.integer :source
      t.decimal :amount, precision: 15, scale: 2
      t.project :references

      t.timestamps null: false
    end
  end
end
