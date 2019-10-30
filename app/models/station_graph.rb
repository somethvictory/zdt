require 'rgl/adjacency'
require 'rgl/traversal'
require 'rgl/dijkstra'

class StationGraph
  def initialize
    @station = Station.new
  end

  def find_shortest_path_without_time_cost(source, destination)
    graph.dijkstra_shortest_path(routes_format_without_weight, source, destination)
  end

  def find_shortest_path_with_time_cost(weight, source, destination)
    graph.dijkstra_shortest_path(routes_format_with_weight(weight), source, destination)
  end

  private
  def graph
    return @graph if @graph.present?

    @graph = RGL::DirectedAdjacencyGraph.new

    add_station_to_graph(@graph, @station.ns, :ns)
    add_station_to_graph(@graph, @station.ew, :ew)
    add_station_to_graph(@graph, @station.cg, :cg)
    add_station_to_graph(@graph, @station.ne, :ne)
    add_station_to_graph(@graph, @station.cc, :cc)
    add_station_to_graph(@graph, @station.dt, :dt)
    add_station_to_graph(@graph, @station.dt, :te)
    add_station_to_graph(@graph, @station.ce, :ce)

    @graph
  end

  def routes_format_without_weight
    hash = {}
    graph.edges.map(&:to_a).each { |edge| hash[edge] = 0 }
    hash
  end

  def routes_format_with_weight(weight)
    hash = {}
    graph.edges.each do |edge|
      if @station.interchanges.include?(edge.source)
        hash[edge.to_a] = weight[:interchange]
      elsif @station.ns.include?(edge.source)
        hash[edge.to_a] = weight[:ns]
      elsif @station.ew.include?( edge.source)
        hash[edge.to_a] = weight[:ew]
      elsif @station.cg.include?(edge.source) && weight[:cg] > 0 # weight[:cg] == 0 means, cg is not operated
        hash[edge.to_a] = weight[:cg]
      elsif @station.ne.include?(edge.source)
        hash[edge.to_a] = weight[:ne]
      elsif @station.cc.include?(edge.source)
        hash[edge.to_a] = weight[:cc]
      elsif @station.dt.include?(edge.source) && weight[:dt] > 0 # weight[:dt] == 0 means, cg is not operated
        hash[edge.to_a] = weight[:dt]
      elsif @station.te.include?(edge.source)
        hash[edge.to_a] = weight[:te]
      elsif @station.ce.include?(edge.source) && weight[:ce] > 0 # weight[:ce] == 0 means, cg is not operated
        hash[edge.to_a] = weight[:ce]
      end
    end

    hash
  end

  def add_station_to_graph(graph, stations, station_name)
    stations.each_with_index do |station, index|
      if stations[index + 1].present?
        if station_name != :ns
          intersection_station = @station.ns.find { |ns_station| ns_station == station }
        elsif station_name != :ew
          intersection_station = @station.ew.find { |ew_station| ew_station == station }
        elsif station_name != :cg
          intersection_station = @station.cg.find { |cg_station| cg_station == station }
        elsif station_name != :ne
          intersection_station = @station.ne.find { |ne_station| ne_station == station }
        elsif station_name != :cc
          intersection_station = @station.cc.find { |cc_station| cc_station == station }
        elsif station_name != :dt
          intersection_station = @station.dt.find { |dt_station| dt_station == station }
        elsif station_name != :te
          intersection_station = @station.te.find { |dt_station| dt_station == station }
        elsif station_name != :ce
          intersection_station = @station.ce.find { |dt_station| dt_station == station }
        end

        graph.add_edge(station, intersection_station) if intersection_station.present?

        graph.add_edge(station, stations[index + 1])
        graph.add_edge(stations[index + 1], station)
      end
    end
  end
end
