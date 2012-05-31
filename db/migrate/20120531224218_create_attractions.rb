class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|

      t.timestamps
    end
  end
end
