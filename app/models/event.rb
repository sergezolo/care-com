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
        events_list = all_activities.union(all_sessions)
        sorted_events = events_list.sort_by{|act| act["start_time_iso_string"]}
        upcoming_events = filter_dates(sorted_events).first(30)
    end

    def self.collect_sessions(series)
        h = []
        series.each do |ser|
            ser["sessions"].each do |ses|
                single_session = ser.merge(ses){|key, old_value, new_value| old_value.to_s.length < new_value.to_s.length ? new_value : old_value}
                h.push(single_session)
            end
        end
        h
    end

    def self.filter_dates(events)
        dates = []
        events.each do |event|
            if event["start_time_iso_string"] >= DateTime.now.iso8601
                dates.push(event)
            end
        end
        dates
    end

    def self.all
        Event.sort_events
    end

    def self.find_event(id)
        event = Event.all.detect {|event| event["id"] = id}
    end
    
end
