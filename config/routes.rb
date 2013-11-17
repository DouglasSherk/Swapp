Swapp::Application.routes.draw do
  get 'pickups' => 'home#pickups'

  get 'templates/:path.html' => 'app/templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
  end

  root 'home#index'
end
