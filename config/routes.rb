Swapp::Application.routes.draw do
  get 'templates/:path.html' => 'templates#page', :constraints => { :path => /.+/ }, :as => 'templates_show'

  scope :templates do
    get '' => 'home#index', :as => 'templates'
    get 'pickups' => 'home#index', :as => 'templates_pickups'
    get 'edit' => 'home#index', :as => 'templates_edit'
    get 'search' => 'home#index', :as => 'templates_search'
    get 'contact' => 'home#index', :as => 'templates_contact'
    get 'calendar' => 'home#index', :as => 'templates_calendar'
    get 'collections/:id' => 'home#index', :as => 'templates_collections'
  end

  root 'home#index'
end
