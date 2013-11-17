Swapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
    get 'recycle' => 'home#index', :as => 'templates_recycle'
    get 'pickups' => 'home#index', :as => 'templates_pickups'
  end

  root 'home#index'
end
