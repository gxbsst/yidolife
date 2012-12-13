Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :photos do
    resources :photos, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :photos, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :photos, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
