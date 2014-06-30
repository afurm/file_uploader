Sequel.migration do
  up do
    create_table :users do
      primary_key :id
      String :handler, null: false
      String :name
      String :encrypted_password, null: false
    end
  end

  down do
    drop_table :users
  end
end