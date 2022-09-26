class ScrappingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #scrapping belghain berlins 
    array = [
      'https://www.berghain.berlin/en/program/',
      'https://www.berghain.berlin/en/program/kantine-am-berghain/',
      'https://www.berghain.berlin/en/program/halle/',
      'https://www.berghain.berlin/en/program/archive/'
    ]
    array.each do |url|
      response = BerlinSpider.process(url)
    end

    #scrapping visitvents 
    i = 0
    total_pages = 20
    while i < total_pages
      url = "https://www.visitberlin.de/en/event-calendar-berlin?page=#{i}/"
      response = CalenderSpider.process(url)
      i+= 1
    end
  end
end