Swapp::Application.routes.draw do
  get 'pickups' => 'home#pickups'

  get 'templates/:path.html' => 'app/templates#page', :constraints => { :path => /.+/ }, :as => 'app_templates_show'

  root 'home#index'
end
