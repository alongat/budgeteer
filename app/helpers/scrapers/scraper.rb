# frozen_string_literal: true

# typed: true

module Scrapers
  class Scraper
    def get_driver(download_dir)
      options = Selenium::WebDriver::Chrome::Options.new()
			# options.add_argument('--headless') 
			options.add_argument('--no-sandbox')
			options.add_argument('--disable-gpu')
			options.add_argument('--disable-popup-blocking')
			options.add_argument('--window-size=1366,768')
			options.add_preference(:download, directory_upgrade: true,
																			prompt_for_download: false,
																			default_directory: download_dir)

			Selenium::WebDriver.for(:chrome, options: options)
    end
  end
end
