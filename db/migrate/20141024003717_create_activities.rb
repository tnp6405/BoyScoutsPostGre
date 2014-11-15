class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, {:id=>false} do |t|
      t.primary_key :activity_id
      t.references :member, index: true
      t.datetime :activity_date
      t.string :activity_ampm
      t.string :activity_type
      t.integer :activity_unit_count

      t.timestamps
    end
  end
end
