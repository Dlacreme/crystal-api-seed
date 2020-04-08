class CreateUser1586282072
  include Clear::Migration

  def change(dir)
    dir.up do
      create_table(:users, id: :uuid) do |t|
        t.column :email, :string, unique: true
        t.column :password, :string
        t.timestamps
      end
    end

    dir.down do
      Clear::SQL.execute("DROP TABLE users;")
    end
  end
end
