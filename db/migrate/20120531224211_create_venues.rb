class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer 	:ticketweb_venue_id
      t.string		:name
      t.string		:url
      t.string		:city
      t.string		:state
      t.string		:postal_code
      t.string		:country
      t.string		:address
      t.string		:twitter_id
      t.string		:venue_image_large
      t.string		:venue_image_small

      t.timestamps
    end
  end
end
