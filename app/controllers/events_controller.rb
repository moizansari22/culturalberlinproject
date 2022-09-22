class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  def create_random
    ScrapeRandomWebsiteJob.perform_later
  end
  def berlin_website
    array = [
      'https://www.berghain.berlin/en/program/',
      'https://www.berghain.berlin/en/program/kantine-am-berghain/',
      'https://www.berghain.berlin/en/program/halle/',
      'https://www.berghain.berlin/en/program/archive/'
    ]
    array.each do |url|
      response = BerlinSpider.process(url)
    end
  end
  def calender_website
    i = 0
    total_pages = 20
    while i < total_pages
      url = "https://www.visitberlin.de/en/event-calendar-berlin?page=#{i}/"
      response = CalenderSpider.process(url)
      i+= 1
    end
  end
  # GET /events/1 or /events/1.json
  def berlins_show
    @events = Event.where(secondtype: "berlinevent")
  end

  def calenders_show
    @events = Event.where(secondtype: "visitevent")
  end

  def search_date
    @events = Event.where(date: params[:search]).or(Event.where("title LIKE ?", "%" + params[:search] + "%"))
  end
end
