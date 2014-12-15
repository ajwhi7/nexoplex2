class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :what
      t.string :when
      t.string :how

      t.timestamps
    end
  end
end
