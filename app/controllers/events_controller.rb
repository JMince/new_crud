class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      @event = Event.new(event_params)
      render:new
    end
  end


  def show
    @event = Event.find(params[:id])
  end


  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)

      redirect_to events_path
    else
      render :edit
    end
  end
  

    private

    def event_params
      params.require(:event).permit(:date, :location, :description, :capacity, :requires_id)

    end

end
