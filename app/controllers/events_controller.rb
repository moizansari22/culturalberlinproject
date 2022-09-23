class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def berlins_show
    @events = Event.where(websource: "berlinevent")
  end

  def calenders_show
    @events = Event.where(websource: "visitevent")
  end

  def search_date
    @events = Event.where(date: params[:search]).or(Event.where("title LIKE ?", "%" + params[:search] + "%"))
  end
end
