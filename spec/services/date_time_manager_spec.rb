require 'rails_helper'

describe DateTimeManager, 'Instance Methods', type: :service do
  let(:date) { '2019-01-31T16:00' }
  subject { described_class.new(date) }

  context '#weekdays' do
    it 'returns true when the passing date is weekdays' do
      expect(subject.weekdays?).to eq true
    end

    it 'returns false when the passing date is not weekdays' do
      subject = described_class.new('2019-01-26T16:00')

      expect(subject.weekdays?).to eq false
    end

  end

  context '#everyday' do
    it 'returns true for any day' do
      subject = described_class.new('2019-01-26T16:00')

      expect(subject.everyday?).to eq true
    end
  end

  context '#busy_hour?' do
    it 'returns true when the time is 6' do
      subject = described_class.new('2019-01-26T6:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns true when the time is between 6 and 9' do
      subject = described_class.new('2019-01-26T8:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns true when the time is 9' do
      subject = described_class.new('2019-01-26T9:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns true when the time is 18' do
      subject = described_class.new('2019-01-26T18:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns true when the time is between 18 and 21' do
      subject = described_class.new('2019-01-26T19:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns true when the time is 21' do
      subject = described_class.new('2019-01-26T21:00')

      expect(subject.busy_hour?).to eq true
    end

    it 'returns false when the time is not between 18 and 21' do
      subject = described_class.new('2019-01-26T22:00')

      expect(subject.busy_hour?).to eq false
    end
  end

  context '#night_hour' do
    it 'returns true when the time is 22' do
      subject = described_class.new('2019-01-26T22:00')

      expect(subject.night_hour?).to eq true
    end

    it 'returns true when the time is between 22 and 6' do
      subject = described_class.new('2019-01-26T23:00')

      expect(subject.night_hour?).to eq true
    end

    it 'returns true when the time is 6' do
      subject = described_class.new('2019-01-26T6:00')

      expect(subject.night_hour?).to eq true
    end

    it 'returns false when the time is not between 22 and 6' do
      subject = described_class.new('2019-01-26T10:00')

      expect(subject.night_hour?).to eq false
    end
  end
end
