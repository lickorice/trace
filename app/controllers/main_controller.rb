class MainController < ApplicationController
  def index
    @hospital = Hospital.first
    arr_beds_current = Bed.where "hospital_id = ? AND vacant = ?", @hospital.hospital_id, false
    arr_beds_total = Bed.where hospital_id: @hospital.hospital_id
    @beds_current = arr_beds_current.length
    @beds_total = arr_beds_total.length
  end
end
