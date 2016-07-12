class CreateEmpties < ActiveRecord::Migration
  def change
    create_table :empties do |t|

      t.timestamps null: false
    end
  end
end
