class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs, {:id=>false} do |t|
      t.primary_key :run_id
      t.references :route, index: true
      t.references :member, index: true
      t.datetime :run_date
      t.integer :time_taken
      t.string :am_pm
      t.text :notes

      t.timestamps
    end
  end
end
