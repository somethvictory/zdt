require 'rails_helper'

describe RouteFindingService, 'Instance Methods', type: :service do
  subject { described_class.new('Holland Village', 'Bugis', '2019-01-31T16:00') }

  context 'when valid required info, #find_shortest_path' do
    it 'returns correct route results' do
      subject.find_shortest_path

      expect(subject.results).to eq [
        'CC21:Holland Village',
        'EW21-CC22:Buona Vista',
        'EW20:Commonwealth',
        'EW19:Queenstown',
        'EW18:Redhill',
        'EW17:Tiong Bahru',
        'EW16-NE3-TE17:Outram Park',
        'EW15:Tanjong Pagar',
        'NS26-EW14:Raffles Place',
        'NS25-EW13:City Hall',
        'EW12-DT14:Bugis'
      ]
      expect(subject.duration).to be_zero
    end
  end

  context 'when invalid required info, #find_shortest_path' do
    it 'populates the error when source is missing' do
      subject = described_class.new(nil, 'Bugis', '2019-01-31T16:00')

      subject.find_shortest_path

      expect(subject.errors).to eq ['Source cannot be empty.', 'Source cannot be found.']
    end

    it 'populates the error when destrination is not found' do
      subject = described_class.new('Holland Village', nil, '2019-01-31T16:00')

      subject.find_shortest_path

      expect(subject.errors).to eq ['Destination cannot be empty.', 'Destination cannot be found.']
    end
  end

  context 'when valid required info, #find_shortest_path_with_time_cost' do
    it 'returns correct route results' do
      subject.find_shortest_path_with_time_cost

      expect(subject.results).to eq [
        'CC21:Holland Village',
        'CC20:Farrer Road',
        'CC19-DT9:Botanic Gardens',
        'DT10-TE11:Stevens',
        'NS21-DT11:Newton',
        'NE7-DT12:Little India',
        'DT13:Rochor',
        'EW12-DT14:Bugis'
      ]
      expect(subject.duration).not_to be_zero
    end
  end

  context 'when invalid required info, #find_shortest_path_with_time_cost' do
    it 'populates the error when source is missing' do
      subject = described_class.new(nil, 'Bugis', '2019-01-31T16:00')

      subject.find_shortest_path

      expect(subject.errors).to eq ['Source cannot be empty.', 'Source cannot be found.']
    end

    it 'populates the error when destrination is not found' do
      subject = described_class.new('Holland Village', nil, '2019-01-31T16:00')

      subject.find_shortest_path

      expect(subject.errors).to eq ['Destination cannot be empty.', 'Destination cannot be found.']
    end
  end
end
