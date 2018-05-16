class SearchController < ApplicationController
  def index
    @zip_code = params[:q]
    @stations = Station.get_nearest(
      location: @zip_code,
      radius: 6.0,
      type: 'ELEC,LGP',
      limit: 10
    )
  end
end
