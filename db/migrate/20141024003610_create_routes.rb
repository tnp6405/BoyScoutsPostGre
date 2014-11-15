class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes, {:id=>false} do |t|
      t.primary_key :route_id
      t.string :route_name
      t.integer :print_sequence

      t.timestamps
    end
  end
end
