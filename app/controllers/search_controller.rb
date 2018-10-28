class SearchController < ApplicationController
  def index
    @options = ["Service Ward", "Semi-Private Room", "Private Room", "ICU"]
  end

  def refer
    @hospitals = Hospital.where.not hospital_id: Hospital.first.hospital_id 
    @hospitals = @hospitals.sort_by {|hospital| hospital.distance}
  end

  def results
    @raw_type = params[:tier]
    if @raw_type == "Service Ward"
      room_id = "service"
    elsif @raw_type == "Semi-Private Room"
      room_id = "semi"
    elsif @raw_type == "Private Room"
      room_id = "private"
    elsif @raw_type == "ICU"
      room_id = "icu"
    end

    @beds = Bed.where "hospital_id = ? AND vacant = ? AND tier = ?", Hospital.first.hospital_id, true, room_id

    if @beds.length == 0
      redirect_to search_refer_url
    end
  end
end
