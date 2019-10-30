class RouteFindingSerializer < ActiveModel::Serializer
  attributes :number_of_stations,
             :duration,
             :source,
             :destination,
             :start_time,
             :steps

  def number_of_stations
    object.results.size
  end

  def duration
    object.duration
  end

  def source
    object.source
  end

  def destination
    object.destination
  end

  def start_time
    object.start_time
  end

  def steps
    all_steps = []
    steps_count = 0
    station = Station.new
    results = object.results
    results.map.with_index do |station_name, index|
      if results[index + 1]
        steps_count += 1
        from     = results[index]
        to       = results[index + 1]

        {
          step: steps_count,
          from: from,
          to:   to
        }
      end
    end.compact
  end
end
