require 'rails_helper'

describe Calendar do
  let(:calendar){ Calendar.new(fake_token) }
  let(:fake_token){ '12345' }

  describe '#days' do
    context "when it's August 24th, 2015 at 5:05pm" do
      before do
        monday = DateTime.new(2015, 8, 24, 17, 5)
        allow(calendar).to receive(:now).and_return(monday)
      end

      it "returns a total of 5 days" do
        allow(calendar).to receive(:events).and_return([])

        expect(calendar.days.length).to eq(5)
      end

      it 'has startup bash on wednesday at 7pm' do
        events_from_google = JSON.parse(File.read('spec/fixtures/events.json'))
        allow(Event).to receive(:events_from_google).and_return(events_from_google)
        wednesday = calendar.days[2]

        hour = wednesday.hours.detect { |hour| hour.hour == 19 }
        startup_bash = hour.events.detect { |event| event.name == 'Start up Bash' }

        expect(startup_bash).to_not be_nil
      end

      it 'has startup bash on wednesday at 8pm' do
        events_from_google = JSON.parse(File.read('spec/fixtures/events.json'))
        allow(Event).to receive(:events_from_google).and_return(events_from_google)
        wednesday = calendar.days[2]

        hour = wednesday.hours.detect { |hour| hour.hour == 20 }
        startup_bash = hour.events.detect { |event| event.name == 'Start up Bash' }

        expect(startup_bash).to_not be_nil
      end

      it 'startup bash is not wednesday at 6pm' do
        events_from_google = JSON.parse(File.read('spec/fixtures/events.json'))
        allow(Event).to receive(:events_from_google).and_return(events_from_google)
        wednesday = calendar.days[2]

        hour = wednesday.hours.detect { |hour| hour.hour == 18 }
        startup_bash = hour.events.detect { |event| event.name == 'Start up Bash' }

        expect(startup_bash).to be_nil
      end

      [6, 7, 8].each do |hour|
        it "has Book of Mormon thursday at #{hour}pm" do
          events_from_google = JSON.parse(File.read('spec/fixtures/events.json'))
          allow(Event).to receive(:events_from_google).and_return(events_from_google)
          thursday = calendar.days[3]

          hour_obj = thursday.hours.detect { |hour_obj| hour_obj.hour == hour + 12 }
          book_of_mormon = hour_obj.events.detect { |event| event.name == 'Book of Mormon' }

          expect(book_of_mormon).to_not be_nil
        end
      end
    end
  end



end
