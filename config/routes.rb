Swapp::Application.routes.draw do

  get 'pickups' => 'home#pickups'

  root 'home#index'

  scope :app do
    get '' => 'home#app', :as => 'app_root'

    get 'templates/:path.html' => 'app/templates#page', :constraints => { :path => /.+/ }, :as => 'app_templates_show'

    scope :templates do
      get '' => 'home#app', :as => 'app_templates'

      # Don't include "template" in these :as paths as it is overly verbose.

      scope :clients do
        get '' => 'home#app', :as => 'app_clients'
        get 'new' => 'home#app', :as => 'app_clients_new'
        get 'recent' => 'home#app', :as => 'app_clients_recent'
        get 'show/:clientId' => 'home#app', :as => 'app_clients_show'
        get 'edit/:clientId' => 'home#app', :as => 'app_clients_edit'
        get 'edit/:clientId/location/' => 'home#app', :as => 'app_clients_new_location'
        get 'edit/:clientId/location/:locationId' => 'home#app', :as => 'app_clients_edit_location'
        get 'templates/:clientId' => 'home#app', :as => 'app_clients_templates'
        get 'notfound' => 'home#app', :as => 'app_clients_notfound'
      end

      scope :auth do
        get '' => 'home#app', :as => 'app_auth'
        get 'login' => 'home#app', :as => 'app_auth_login'
        get 'sign_up' => 'home#app', :as => 'app_auth_sign_up'
        get 'forbidden' => 'home#app', :as => 'app_auth_forbidden'
        get 'reset_password' => 'home#app', :as => 'app_auth_reset_password'
      end

      scope :brokerage do
        get 'index' => 'home#app', :as => 'app_brokerage'
        get 'stats' => 'home#app', :as => 'app_brokerage_stats'
      end

      scope :users do
        get 'show/:userId' => 'home#app', :as => 'app_users_show'
      end
    end
  end
end
