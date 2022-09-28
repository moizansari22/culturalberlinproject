class EventsController < ApplicationController
  
  def index
    if params[:websource].present?
      @events = Event.where("websource LIKE ?", params[:websource])
    else
      @events = Event.all
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
