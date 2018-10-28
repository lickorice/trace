class SearchController < ApplicationController
  def index
    @options = ["Service Ward", "Semi-Private Room", "Private Room", "ICU"]
  end

  def refer
    @target = params[:target]
    @hospitals = Hospital.where.not hospital_id: Hospital.first.hospital_id
    new_hospitals = []
    @hospitals.each do |hospital|
      bed_count_total = Bed.where "hospital_id = ? AND tier = ?", hospital.hospital_id, @target
      bed_count_curr = Bed.where "hospital_id = ? AND tier = ? AND vacant = ?", hospital.hospital_id, @target, false
      if bed_count_curr.length == bed_count_total.length
        next
      end
      new_hospitals.push(hospital)
    end
    @hospitals = new_hospitals
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
      redirect_to search_refer_url target:room_id
    end
  end
end
