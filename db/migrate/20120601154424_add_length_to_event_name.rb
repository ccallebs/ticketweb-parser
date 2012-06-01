class AddLengthToEventName < ActiveRecord::Migration
  def change
  	change_column :events, :name, :text, { :length => 4000 }
  end
end
