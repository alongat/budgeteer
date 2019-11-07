json.extract! transaction, :id, :created_at, :updated_at
json.url mtransaction_url(transaction, format: :json)
