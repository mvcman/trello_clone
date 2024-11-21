class UsersController < ApplicationController
  before_action :set_user, only: %i[show attendance]
  before_action :set_data, only: %i[show attendance]

  def show
    @date_range = (Time.zone.today.beginning_of_month..Time.zone.yesterday).to_a.reverse
    if params[:date].present?
      start_date = Time.zone.parse(params[:date]) if params[:date].present?
      end_date = start_date.to_date.end_of_month
      if end_date >= Time.zone.yesterday
        end_date = Time.zone.yesterday
      end 
      @date_range = (start_date.to_date..end_date).to_a.reverse
    end
  end

  def attendance
    start_date = Time.zone.parse(params[:date]) if params[:date].present?
    end_date = start_date.to_date.end_of_month
    if end_date >= Time.zone.yesterday
      end_date = Time.zone.yesterday
    end 
    @date_range = (start_date.to_date..end_date).to_a.reverse
    render(partial: "attendance", locals: { date_range: @date_range, holidays: @holidays, leaves: @leaves, attendances: @attendances })
  end 

  private 
  def set_user 
    @user = User.find(params[:id])
  end 

  def set_data
    @holidays = Holiday.all
    @leaves = Leaf.where(user_id: @user.id)
    @attendances = Attendance.where(user_id: @user.id)
  end 
end
