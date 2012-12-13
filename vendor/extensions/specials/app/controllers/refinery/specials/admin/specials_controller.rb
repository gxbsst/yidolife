module Refinery
  module Specials
    module Admin
      class SpecialsController < ::Refinery::AdminController

        crudify :'refinery/specials/special', :xhr_paging => true

      end
    end
  end
end
