class ShortestRoutesController < ApplicationController
  def index
    finder = RouteFindingService.new(
              permitted_params[:source],
              permitted_params[:destination],
              permitted_params[:start_time]
            )

    if permitted_params[:time_optimised]
      finder.find_shortest_path_with_time_cost
    else
      finder.find_shortest_path
    end

    if finder.errors.any?
      render json: { errors: finder.errors }
    else
      render json: RouteFindingSerializer.new(finder).to_json
    end
  end

  def permitted_params
    params.permit(:source, :destination, :start_time, :time_optimised)
  end
end
