class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      # details
      t.integer 	      :ticketweb_event_id
      t.string 		:facebook_event_id
      t.string 		:name
      t.string 		:description, :limit => 2000
      t.string 		:url
      t.string 		:tags
      t.string		:timezone
      t.string		:status
      t.string		:additional_listing_text

      # dates
      t.datetime 	      :start_date
      t.datetime	      :end_date
      t.datetime	      :on_sale_date

  	# images
      t.string 		:event_image_url_large
      t.string		:event_image_url_small

      # prices
      t.decimal		:price_low
      t.decimal		:price_high
      t.decimal		:price_display

      # venue foreign keys
      t.integer         :venue_id
      t.integer         :ticketweb_venue_id

      t.timestamps
    end
  end
end
