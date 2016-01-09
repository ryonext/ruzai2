ActiveRecord::Base.configurations = {'test' => {adapter: 'sqlite3', database: ':memory:'}}
ActiveRecord::Base.establish_connection :test

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:ruzai_lists) do |t|
      t.integer :test_id1
      t.integer :test_id2
      t.integer :test_id3
      t.datetime :expired_at
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
