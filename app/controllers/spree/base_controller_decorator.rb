module Spree
  BaseController.class_eval do
    before_filter :process_affiliate

    private 
    def process_affiliate
      return unless params[:affiliate_id]
      cookie = cookies[Spree::Config[:cookie_name]]
      if !cookie
        cookies[Spree::Config[:cookie_name]] = { :value => params[:affiliate_id],
          :expires => Time.now+Spree::Config[:cookie_life_span].to_i.day }
        puts 'created cookie for referrer -'+cookies[Spree::Config[:cookie_name]]+'|'
      else
        puts 'found cookie for referrer -'+cookies[Spree::Config[:cookie_name]]+'|'
      end
    end
  end
end
