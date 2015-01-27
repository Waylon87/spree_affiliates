Spree::Core::Engine.routes.draw do
  match 'admin/affiliate_settings/show' =>  'admin/affiliate_settings#show', :as => :admin_affiliate_settings, via: :get
  match 'admin/affiliate_settings/edit' =>  'admin/affiliate_settings#edit', :as => :admin_edit_affiliate_settings, via: :get
  match 'admin/affiliate_settings/update' =>  'admin/affiliate_settings#update', :as => :admin_update_affiliate_settings, via: [:patch, :put]
  match 'admin/affiliate_credits/update' =>  'admin/affiliate_credits#update', :as => :admin_update_affiliate_credits, via: :post
  match 'affiliates/learn_more' =>  'affiliates#whats_this', :as => :whats_this, via: :get
  match 'affiliates/show_details' =>  'affiliates#show_details', :as => :show_details, via: :get
  match 'affiliates/request_payment' =>  'affiliates#request_payment', :as => :request_payment, via: :get
  match 'affiliates/pay_user' =>  'affiliates#pay_user', :as => :pay_user, via: :get
  namespace :admin do
    resources :users do
      resources :affiliate_credits
    end
  end
end
