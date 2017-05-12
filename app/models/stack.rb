class Stack < ActiveRecord::Base
  belongs_to :room
  has_many :items

  accepts_nested_attributes_for :room, 
	reject_if: proc{ |x| x['name'].blank?},
	allow_destroy: true	
end
