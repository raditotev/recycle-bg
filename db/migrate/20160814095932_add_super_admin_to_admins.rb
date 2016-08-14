class AddSuperAdminToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :super, :boolean
  end
end
