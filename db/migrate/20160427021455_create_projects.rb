class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.decimal :abc, precision: 15, scale: 2
      t.integer :status
      t.integer :bidding_status
      t.string :contractor
      t.integer :progress
      t.datetime :tdc
      t.datetime :noa
      t.datetime :ntp
      t.datetime :adc
      t.decimal :cost, precision: 15, scale: 2
      t.references :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
