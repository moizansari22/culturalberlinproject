class EventsController < ApplicationController
  def index
    if params[:websource].present?
      @events = Event.where("websource LIKE ?", params[:websource])
    else
      @events = Event.all
    end
  end

  def search_date
    @events = Event.where(date: params[:search]).or(Event.where("title LIKE ?", "%" + params[:search] + "%"))
  end
end
