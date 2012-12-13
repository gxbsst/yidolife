Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :specials do
    resources :specials, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :specials, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :specials, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
