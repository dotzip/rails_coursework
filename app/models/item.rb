class Item < ActiveRecord::Base
  belongs_to :client
  belongs_to :stack

  accepts_nested_attributes_for :client,
	reject_if: proc{ |x| x['entity_name'].blank?},
	allow_destroy: true	

end
