class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
