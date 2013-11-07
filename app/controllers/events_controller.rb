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


end
