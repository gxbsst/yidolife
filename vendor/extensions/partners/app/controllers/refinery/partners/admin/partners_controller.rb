module Refinery
  module Partners
    module Admin
      class PartnersController < ::Refinery::AdminController

        crudify :'refinery/partners/partner', :xhr_paging => true

      end
    end
  end
end
