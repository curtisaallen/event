class Event < ActiveRecord::Base
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
