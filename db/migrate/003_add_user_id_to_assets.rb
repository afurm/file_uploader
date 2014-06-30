Sequel.migration do
  up do
    alter_table :assets do
      add_column :user_id, Integer
    end
  end

  down do
    alter_table :assets do
      drop_column :user_id
    end
  end
end