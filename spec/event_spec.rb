require_relative '../lib/event'

describe 'Test if the class Event responds correctly' do

  describe 'Create instances of Event class' do

    it 'create an event and call its methods' do
      my_event = Event.new('2021-06-03 10:00', 120, 'Dentist', ['me'])
      expect(my_event.start_date).to be_a_kind_of(Time)
      expect(my_event.duration).to eq(7200)
      expect(my_event.end_date).to be_a_kind_of(Time)
      expect(my_event.is_past?).to eq(false)
      expect(my_event.is_future?).to eq(true)
      expect(my_event.is_soon?).to eq(false)
    end

    it 'verify that the postpone method works' do
      to_postpone = Event.new('2021-06-04 10:00', 120, 'Brunch', ['me', 'her'])
      before = to_postpone.start_date.dup
      to_postpone.postpone_24h
      after = to_postpone.start_date
      expect(after).to eq(before + 24 * 60 * 60)
    end
  end
end
