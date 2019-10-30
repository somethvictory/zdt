require 'rails_helper'

describe StationGraph, 'Instance Methods', type: :model do
  context '#find_shortest_path_without_time_cost' do
    before do
      @mocked_method = double('routes_format_without_weight)', routes_format_without_weight: true)
      allow(subject).to receive(:routes_format_without_weight).and_return(@mocked_method)
    end

    it 'calls dijkstra method with required arguments' do
      expect_any_instance_of(RGL::DirectedAdjacencyGraph).to receive(:dijkstra_shortest_path).with(@mocked_method, 'Boon Lay', 'Little India')

      subject.find_shortest_path_without_time_cost('Boon Lay', 'Little India')
    end
  end

  context '#find_shortest_path_with_time_cost' do
    before do
      @mocked_method = double('routes_format_without_weight)', routes_format_without_weight: true)
      allow(subject).to receive(:routes_format_with_weight).and_return(@mocked_method)
    end

    it 'calls dijkstra method with required arguments' do
      expect_any_instance_of(RGL::DirectedAdjacencyGraph).to receive(:dijkstra_shortest_path).with(@mocked_method, 'Boon Lay', 'Little India')

      subject.find_shortest_path_with_time_cost({}, 'Boon Lay', 'Little India')
    end
  end
end
