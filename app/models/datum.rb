class Datum < ApplicationRecord

    def self.get_events
        url = 'https://api.getgalore-staging.com/v1/events'
        response = HTTParty.get(url, :headers => { "Api-Key" => ENV["KEY"] })
    end 

    def self.seed_data(data)
        event = Event.new
        event.page = data["page"]
        event.total = data["total"]
        event.last_page = data["last_page"]
        event.notification = data["notification"]
        activities = data["activities"]
        activities.each do |activity|
            activ = event.activities.new
            activ.event_id = event.id
            activ.id = activity["id"]
            activ.primary_key = activity["primary_key"]
            activ.title = activity["title"]
            activ.drop_in = activity["drop_in"]
            activ.indoor = activity["indoor"]
            activ.outdoor = activity["outdoor"]
            activ.online = activity["online"]
            activ.about = activity["about"]
            activ.purchasable = activity["purchasable"]
            activ.available_spots = activity["available_spots"]
            activ.start_months_old = activity["start_months_old"]
            activ.end_months_old = activity["end_months_old"]
            activ.instructions = activity["instructions"]
            activ.camp = activity["camp"]
            activ.date_night = activity["date_night"]
            activ.day_pass = activity["day_pass"]
            activ.drop_off = activity["drop_off"]
            activ.allows_waitlist = activity["allows_waitlist"]
            activ.only_purchasable_as_trial = activity["only_purchasable_as_trial"]
            activ.unique_product_id = activity["unique_product_id"]
            activ.currency = activity["currency"]
            activ.link = activity["link"]
            activ.online_link = activity["online_link"]
            activ.updated = activity["updated"]
            activ.schedule_id = activity["schedule_id"]
            activ.price_integer = activity["price_integer"]
            activ.price = activity["price"]
            activ.web_url = activity["web_url"]
            activ.for_kids = activity["for_kids"]
            activ.start_time = activity["start_time"]
            activ.end_time = activity["end_time"]
            activ.start_time_iso_string = activity["start_time_iso_string"]
            activ.end_time_iso_string = activity["end_time_iso_string"]
            activ.purchasable_start_time = activity["purchasable_start_time"]
            activ.purchasable_end_time = activity["purchasable_end_time"]
            activ.instructors = activity["instructors"]
            activ.discounts = activity["discounts"]
            activ.save
        end
        event.save
    end

end
