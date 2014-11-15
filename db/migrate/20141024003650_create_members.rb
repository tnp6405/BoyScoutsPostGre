class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, {:id=>false} do |t|
      t.primary_key :member_id
      t.string :member_last_name
      t.string :member_first_name
      t.string :member_cell
      t.string :member_landline
      t.string :member_email
      t.boolean :member_inactive
      t.string :member_vehicle

      t.timestamps
    end
  end
end
