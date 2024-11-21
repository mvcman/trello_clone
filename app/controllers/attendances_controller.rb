class AttendancesController < ApplicationController
  before_action :set_user, only: %i[ new create ]

  def new
    @attendance = Attendance.new
    @attendance.check_in_time = Time.zone.now 
    @attendance.check_out_time = Time.zone.now + 8.hour
  end

  def create
    @attendance = @user.attendances.build(attendance_params)
    respond_to do |format|
      if @attendance.save  
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  private 

  def attendance_params 
    params.require(:attendance).permit(:check_in_time, :check_out_time, :attendance_status_id, :user_id)
  end 

  def set_user
    @user = User.find(params[:user_id])
  end 
end
