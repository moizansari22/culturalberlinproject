class EventsController < ApplicationController
  def index
    if params[:websource].present?
      @events = Event.where("websource LIKE ?", params[:websource]).paginate(:page => params[:page], :per_page => 10)
    else
      @events = Event.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def search_date
    @events = Event.where(date: params[:search]).or(Event.where("title LIKE ?", "%" + params[:search] + "%"))
  end
end
