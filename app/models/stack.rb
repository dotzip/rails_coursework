class Stack < ActiveRecord::Base
  belongs_to :room
  has_many :items
    
    validates :number, :places, :width, :height, :depth, :max_total_load, presence: true

  accepts_nested_attributes_for :room, 
	#reject_if: proc{ |x| x['name'].blank?},
	allow_destroy: true	
end
