class Item < ActiveRecord::Base
  belongs_to :client
  belongs_to :stack
end
