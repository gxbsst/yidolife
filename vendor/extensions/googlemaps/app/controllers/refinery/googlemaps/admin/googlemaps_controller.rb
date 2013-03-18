module Refinery
  module Googlemaps
    module Admin
      class GooglemapsController < ::Refinery::AdminController

        crudify :'refinery/googlemaps/googlemap',
                :title_attribute => 'address', :xhr_paging => true

      end
    end
  end
end
