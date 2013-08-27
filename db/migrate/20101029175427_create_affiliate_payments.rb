class CreateAffiliatePayments < ActiveRecord::Migration
  def change
    create_table :spree_affiliate_payments do |t|
      t.integer :user_id
      t.integer :affiliate_user_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
