class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.references :project, index: true, foreign_key: true
      t.string :title
      t.decimal :abc, precision: 15, scale: 2
      t.integer :status
      t.integer :classification
      t.integer :bidding_status
      t.string :contractor
      t.integer :progress
      t.datetime :tdc
      t.datetime :noa
      t.datetime :ntp
      t.datetime :adc
      t.decimal :cost, precision: 15, scale: 2
      t.text :remarks

      t.timestamps null: false
    end
  end
end
