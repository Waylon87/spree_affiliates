module Spree
  class AffiliateCredit < ActiveRecord::Base
    belongs_to :user
    belongs_to :affiliate_payment

    #attr_accessible :comment, :amount, :user_id, :status
  end
end
