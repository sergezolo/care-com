class Event < ApplicationRecord

    def self.get_events
        url = 'https://api.getgalore-staging.com/v1/events'
        response = HTTParty.get(url, :headers => { "Api-Key" => ENV["KEY"] })
    end 

    def self.sort_events
        all_events = Event.get_events
        all_activities = all_events["activities"]
        sorted_activities = all_activities.sort_by{|act| act["start_time_iso_string"]}.first(30)
        # all_series = all_events["series"]
        # binding.pry
        # series_sessions = all.series["sessions"]


    end

    def self.all
        # binding.pry
        Event.sort_events
    end

    def self.find_event(id)
        event = Event.all.detect {|event| event["id"] = id}
    end

end
