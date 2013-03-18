Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :googlemaps do
    resources :googlemaps, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :googlemaps, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :googlemaps, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
