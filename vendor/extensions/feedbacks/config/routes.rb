Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :feedbacks do
    resources :feedbacks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :feedbacks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :feedbacks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
