class Item < ActiveRecord::Base
  belongs_to :client
  belongs_to :stack
    
    validates :width, :height, :depth, :weight, :receipt_date, :contract_number, :place, :contract_expiry_date, presence: true
    validates :contract_number, uniqueness: true

  accepts_nested_attributes_for :client,
	reject_if: proc{ |x| x['entity_name'].blank?},
	allow_destroy: true	
        
  def self.search(params)
     result = Item.includes(:client, :stack).references(:client, :stack)
     max_date = Item.maximum("receipt_date")
     min_date = Item.minimum("receipt_date")
      
    ### Поиск по размерам ###
     if params['width'].present?
       result = result.where(width: params['width'])
     end
      
     if params['height'].present?
       result = result.where(height: params['height'])
     end
      
     if params['depth'].present?
       result = result.where(depth: params['depth'])
     end
      
     if params['weight'].present?
       result = result.where(weight: params['weight'])
     end
     
      
    ### Поиск по диапазону дат ###  
     if !params['date_from'].present? && !params['date_to'].present?
        result.all
     elsif params['date_from'].present? && params['date_to'].present?
        result = result.where("receipt_date >= ? AND receipt_date <= ?", params['date_from'], params['date_to'])
     elsif params['date_from'].blank?
        result = result.where("receipt_date >= ? AND receipt_date <= ?", min_date, params['date_to'])
     elsif params['date_to'].blank?
        result = result.where("receipt_date >= ? AND receipt_date <= ?", params['date_from'], max_date)
     end
      
      
      
      
     result.all
  end

end
