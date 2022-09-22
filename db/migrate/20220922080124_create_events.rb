class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :bar
      t.text :teaser
      t.string :day
      t.string :date
      t.string :secondtype
      t.string :start_time

      t.timestamps
    end
  end
end
