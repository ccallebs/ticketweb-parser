class Attraction < ActiveRecord::Base
  belongs_to :event

  validates_uniqueness_of :artist_id

  def populate(data)
    @sequence = data['sequence']
    @artist_name = data['artist']
    @billing = data['billing']

    @links = ""

    unless data['links'].class != "string"
      data['links'].each do |l, index|
        @links += " | " unless index == 0
        @links += l['url']
      end
    end
  end
end
