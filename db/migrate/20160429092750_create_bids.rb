class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
