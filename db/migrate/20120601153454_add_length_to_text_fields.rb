class AddLengthToTextFields < ActiveRecord::Migration
  def change
  	change_column :events, :description, :text, { :limit => 4000 }
  	change_column :events, :additional_listing_text, :text, { :limit => 4000 }
  end
end
