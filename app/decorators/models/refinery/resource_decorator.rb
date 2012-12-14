#encoding: utf-8
# Open the Refinery::Page model for manipulation
Refinery::Resource.class_eval do
  attr_accessible :category, :picture_id, :name

  CATEGORY_VALUES = %w(指南 其他)
  # Add an association to the Refinery::Image class, so we
  # can take advantage of the magic that the class provides
  belongs_to :picture, :class_name => '::Refinery::Image'

end
