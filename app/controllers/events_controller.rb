class EventsController < ApplicationController

    def index 
        @events = Activity.all
    end

    # def show 
    #     # binding.pry
    #     @event = Event.find_event(params["id"])
    # end

end