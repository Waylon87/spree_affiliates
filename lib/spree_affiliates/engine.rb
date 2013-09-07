module SpreeAffiliateSm
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_affiliates'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::AppConfiguration.class_eval do
        preference :cookie_name, :string, default: 'sm_referrerid'
        preference :cookie_life_span, :integer
        preference :claimable_amount, :decimal, default: 0.0
        preference :referal_incentive, :decimal, default: 0.0
        preference :affiliate_payment_request, :string
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
