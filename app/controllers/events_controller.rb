class EventsController < ActionController::API

  def index
    @events = Event.all
    render :json => @events
  end

end
