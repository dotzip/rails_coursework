class Item < ActiveRecord::Base
  belongs_to :client
  belongs_to :stack
    
    validates :width, :height, :depth, :weight, :receipt_date, :contract_number, :place, :contract_expiry_date, presence: true
    validates :contract_number, uniqueness: true

  accepts_nested_attributes_for :client,
	reject_if: proc{ |x| x['entity_name'].blank?},
	allow_destroy: true	

end
