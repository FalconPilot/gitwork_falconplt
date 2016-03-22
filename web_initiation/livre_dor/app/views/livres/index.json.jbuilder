json.array!(@livres) do |livre|
  json.extract! livre, :id, :msg, :username
  json.url livre_url(livre, format: :json)
end
