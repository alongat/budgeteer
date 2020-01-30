# frozen_string_literal: true

# typed: true

class ScraperManager 
	extend T::Sig

	def self.scrape!(website=:all, 
									download_dir="#{Rails.root}/tmp", 
									date_range=(1.month.ago..Time.now))

		
	end
end