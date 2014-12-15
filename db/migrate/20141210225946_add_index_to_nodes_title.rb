class AddIndexToNodesTitle < ActiveRecord::Migration
  def change
  	add_index :nodes, :title, unique: true
  end
end
