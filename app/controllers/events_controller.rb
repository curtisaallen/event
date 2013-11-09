class EventsController < ApplicationController
	def index
		@events = Event.all
		@events = Event.search(params[:search])
	end

	def show
       @event = Event.find(params[:id])
	end

	def about

	end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      event_params = params.require(:event).permit(:name, :description, :location, :price, :starts_at)
      @event.update(event_params)
      redirect_to @event
    end


end
