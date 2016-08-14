class UpdateSuperAdminInAdmins < ActiveRecord::Migration[5.0]
  def change
    change_column :admins, :super, :boolean, default: false
  end
end
