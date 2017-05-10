json.extract! item, :id, :width, :height, :depth, :weight, :receipt_date, :contract_number, :place, :contract_expiry_date, :client_id, :stack_id, :created_at, :updated_at
json.url item_url(item, format: :json)
