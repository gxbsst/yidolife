module Refinery
  module Photos
    module Admin
      class PhotosController < ::Refinery::AdminController

        crudify :'refinery/photos/photo', :xhr_paging => true

      end
    end
  end
end
