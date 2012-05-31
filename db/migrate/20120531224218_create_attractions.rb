class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.integer 		:sequence
      t.string			:artist_name
      t.integer			:artist_id
  	  t.decimal			:billing
  	  t.string			:links
      t.integer     :event_id

      t.timestamps
    end
  end
end
