class Event < ApplicationRecord

    def self.get_events
        url = 'https://api.getgalore-staging.com/v1/events'
        response = HTTParty.get(url, :headers => { "Api-Key" => ENV["KEY"] })
    end 

    def self.sort_events
        all_events = Event.get_events
        all_activities = all_events["activities"]
        all_series = all_events["series"]
        all_sessions = collect_sessions(all_series)
        events_list = all_activities + all_sessions
        sorted_activities = events_list.sort_by{|act| act["start_time_iso_string"]}


        # DateTime.now.iso8601
    end

    def self.collect_sessions(series)
        h = []
        series.each do |ser|
            ser["sessions"].each do |ses|
                single_session = ser.merge(ses)
                h.push(single_session)
            end
        end
        # binding.pry
        h
    end

    def self.all
        Event.sort_events
    end

    def self.find_event(id)
        event = Event.all.detect {|event| event["id"] = id}
    end

end
