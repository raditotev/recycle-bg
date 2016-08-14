class ChangeSuperAdminColumnNameInAdmins < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :super, :super_admin
  end
end
