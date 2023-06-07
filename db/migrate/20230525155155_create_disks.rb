class CreateDisks < ActiveRecord::Migration[6.1]
  def change
    create_table :disks do |t|

      t.timestamps
    end
  end
end
