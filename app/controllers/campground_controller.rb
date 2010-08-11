class CampgroundController < ApplicationController

  helper_method :current_campground

private

  def current_campground
    return @current_campground if defined?(@current_campground)
    @current_campground = Campground.find_by_subdomain!(request.subdomain)
  end

end