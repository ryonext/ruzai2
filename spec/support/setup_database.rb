ActiveRecord::Base.configurations = {'test' => {adapter: 'sqlite3', database: ':memory:'}}
ActiveRecord::Base.establish_connection :test

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:ruzai_lists) do |t|
      t.integer :user_id
      t.integer :hoge_id
      t.integer :fuga_id
      t.datetime :expired_at
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
