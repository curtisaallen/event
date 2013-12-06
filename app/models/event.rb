class Event < ActiveRecord::Base

	validates :name, :description, :location, presence: true
	validates :description, length: {minimum: 25}

	validates :price, numericality: { greater_than_or_equal_to: 0}
	validates :capacity, numericality: {only_integer: true, greater_than: 0}
    
    validates :image_file_name, allow_blank: true, format: {
    	with: /\w+\.(gif|jpg|png)\z/i,
    	message: "Must reference a GIF, JPG, or PNG image"
    }
	def free?
		price.blank? || price.zero?
	end

	def self.search(search)
	  if search
	    where 'name LIKE ?', "%#{search}%"
	  else
	    scoped
	  end
	end

	def self.upcoming
        where("starts_at >= ?", Time.now).order("starts_at")
	end


end
