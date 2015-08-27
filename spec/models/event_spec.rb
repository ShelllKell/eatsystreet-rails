require 'rails_helper'

describe Event do

  describe '.all_events' do
    it 'parses Google calendar data into an array of Events' do
      events_from_google = JSON.parse(File.read('spec/fixtures/events.json'))
      allow(Event).to receive(:events_from_google).and_return(events_from_google)

      token = SecureRandom.hex(5)
      start = Date.today
      stop  = Date.today + 5


      events = Event.all_events(token, start, stop)

      expect(events.length).to eq(44)
    end
  end


end
