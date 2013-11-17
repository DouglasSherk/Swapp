Swapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index'
    get 'recycle' => 'home#index'
    get 'pickups' => 'home#index'
  end

  root 'home#index'
end
