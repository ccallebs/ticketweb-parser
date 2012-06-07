class Attraction < ActiveRecord::Base
  belongs_to :event

  validates_uniqueness_of :artist_id

  def self.new_with_data(data)
    attraction = Attraction.where(:artist_id => data['artistid']).first_or_create

    attraction.sequence = data['sequence']
    attraction.artist_name = data['artist']
    attraction.billing = data['billing']

    attraction.links = ""

    unless data['links'].class != "string"
      data['links'].each do |l, index|
        attraction.links += " | " unless index == 0
        attraction.links += l['url']
      end
    end

    attraction
  end
end
