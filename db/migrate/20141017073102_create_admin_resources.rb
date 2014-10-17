class CreateAdminResources < ActiveRecord::Migration
  def change
    create_table :admin_resources do |t|
      t.string :name

      t.timestamps
    end

    add_attachment :admin_resources, :asset
  end
end
