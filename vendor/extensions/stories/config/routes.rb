Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :stories do
    resources :stories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :stories, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :stories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
