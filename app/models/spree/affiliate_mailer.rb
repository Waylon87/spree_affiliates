module Spree
  class AffiliateMailer < ActionMailer::Base
    helper "spree/base"
    default_url_options[:host] = Spree::Config[:site_url]

    def request_payment(user)
      @subject    = 'Affiliate payment request.'
      @user       = user
      @recipients = Spree::Config[:affiliate_payment_request]
      @from       = user.email

      mail to: @recipients, subject: @subject, from: @from
    end

  end
end
