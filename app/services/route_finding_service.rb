class RouteFindingService
  attr_reader :source, :destination, :start_time, :with_time_cost, :duration, :errors, :results

  def initialize(source, destination, start_time)
    @source         = source
    @destination    = destination
    @start_time     = start_time
    @station_graph  = StationGraph.new
    @duration       = 0
    @errors         = []
    @results        = nil
  end

  def find_shortest_path
    return unless valid_required_info?

    from = station.label_by_name(source)
    to   = station.label_by_name(destination)

    @results = @station_graph.find_shortest_path_without_time_cost(from, to)
  end

  def find_shortest_path_with_time_cost
    return unless valid_required_info?

    from = station.label_by_name(source)
    to   = station.label_by_name(destination)
    @results = @station_graph.find_shortest_path_with_time_cost(weight, from, to)

    calculate_duration

    @results
  end

  private
  def calculate_duration
    @results.each_with_index do |name, index|
      # if it is interchange and the next and the previous station is different, add waiting for the interchange to duration
      if station.interchanges.include?(name) && abbreviation(@results[index - 1]) != abbreviation(@results[index + 1])
        @duration += weight[:interchange]
      end

      if station.ns.include?(name)
        @duration += weight[:ns]
      elsif station.ew.include?(name)
        @duration += weight[:ew]
      elsif station.cg.include?(name)
        @duration += weight[:cg]
      elsif station.ne.include?(name)
        @duration += weight[:ne]
      elsif station.cc.include?(name)
        @duration += weight[:cc]
      elsif station.dt.include?(name)
        @duration += weight[:dt]
      elsif station.te.include?(name)
        @duration += weight[:te]
      elsif station.ce.include?(name)
        @duration += weight[:ce]
      end
    end
  end

  def station
    @station ||= Station.new
  end

  def weight
    return @weight if @weight.present?

    time    = DateTimeManager.new(start_time)
    @weight = { ns: 10, ew: 10, cg: 10, ne: 10, cc: 10, dt: 8, te: 8, interchange: 10 }

    if time.weekdays? && time.busy_hour?
      @weight = { ns: 12, ew: 10, cg: 10, ne: 12, cc: 10, dt: 10, te: 10, interchange: 15 }
    elsif time.night_hour?
      @weight = { ns: 12, ew: 10, cg: 0, ne: 12, cc: 10, dt: 0, te: 8, interchange: 10 }
    end

    @weight
  end

  def valid_required_info?
    @errors << 'Source cannot be empty.' unless source.present?
    @errors << 'Source cannot be found.' unless station.code_by_name(source)
    @errors << 'Destination cannot be empty.' unless destination.present?
    @errors << 'Destination cannot be found.' unless station.code_by_name(destination)

    begin
      DateTime.parse(start_time)
    rescue ArgumentError, TypeError
      @errors << 'Invalid Date'
    end

    @errors.empty?
  end

  def abbreviation(station)
    station.to_s[0..1]
  end
end
