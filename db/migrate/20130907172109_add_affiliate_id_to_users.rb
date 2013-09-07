class AddAffiliateIdToUsers < ActiveRecord::Migration
  def change
    add_column Spree.user_class.table_name, :affiliate_id, :string
  end
end
