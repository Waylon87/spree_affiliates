class AddOtherInfoToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :website, :string
    add_column :spree_users, :full_name, :string
    add_column :spree_users, :phone, :string
  end
end
