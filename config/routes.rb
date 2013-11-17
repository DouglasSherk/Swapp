Swapp::Application.routes.draw do
  get 'pickups' => 'home#pickups'

  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
    get 'pickups' => 'home#pickups', :as => 'templates_pickups'
  end

  root 'home#index'
end
