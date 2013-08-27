class CreateAffiliateCredits < ActiveRecord::Migration
  def change
    create_table :spree_affiliate_credits do |t|
      t.integer :user_id
      t.string  :status
      t.string  :comment
      t.integer :affiliate_payment_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
