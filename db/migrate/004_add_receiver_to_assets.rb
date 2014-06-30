Sequel.migration do
  up do
    alter_table :assets do
      add_column :receiver, String
    end
  end

  down do
    alter_table :assets do
      drop_column :receiver
    end
  end
end