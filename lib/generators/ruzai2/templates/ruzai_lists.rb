class RuzaiLists < ActiveRecord::Migration
  def change
    add_column :hoge_id, :integer, index: true
    add_column :fuga_id, :integer, index: true
    add_column :foo_id, :integer, index: true
    add_column :expired_at, :datetime, index: true
  end
end
