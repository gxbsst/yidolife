class AddStoryIdToRefineryPortfolioGalleries < ActiveRecord::Migration
  def change
    add_column :refinery_portfolio_galleries, :story_id, :integer
  end
end
