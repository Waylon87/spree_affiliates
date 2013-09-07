require 'digest/sha1'

Spree.user_class.class_eval do

  attr_accessible :full_name, :website, :phone, :affiliate_id

  has_many :affiliate_earnings do
    def unpaid
      @unpaidEarnings ||= find(:all, {
        :select => "#{Spree::AffiliateEarning.table_name}.* ",
        :joins  => "JOIN #{Spree::Order.table_name} ON #{Spree::Order.table_name}.id = #{Spree::AffiliateEarning.table_name}.order_id ",
        :conditions => "#{Spree::Order.table_name}.state = 'complete' and #{Spree::AffiliateEarning.table_name}.status != 'paid'"
      })
    end
  end

  has_many :affiliate_credits do
    def unpaid
      @unpaidCredits ||= find(:all, :conditions => "status != 'paid'")
    end
  end

  def earnings_total
      total = 0
      self.affiliate_earnings.unpaid.each do |earning|
        total = total+earning.amount
      end
      total
  end

  def credits_total
      total = 0
      self.affiliate_credits.unpaid.each do |credit|
        total = total+credit.amount
      end
      total
  end

  def total_earnings
      self.earnings_total + self.credits_total
  end

  def website_url
    if website && !website.downcase.include?("http")
      "http://#{website}"
    else
      self.website
    end
  end

  def affiliate_id
    return self[:affiliate_id] if self[:affiliate_id]

    record = true
    while record
      random = "#{Array.new(9){rand(9)}.join}"
      record = self.class.where(affiliate_id: random).first
    end

    self.update_attributes(affiliate_id: random)

    self.affiliate_id
  end
end
