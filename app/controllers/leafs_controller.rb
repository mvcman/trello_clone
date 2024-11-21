class LeafsController < ApplicationController
  before_action :set_user, only: %i[ new create edit update destroy]

  def new
    @leaf = Leaf.new
    @leaf.start_date = Time.zone.now 
    @leaf.end_date = Time.zone.now
  end

  def create
    @leaf = @user.leafs.build(leaf_params)
    respond_to do |format|
      if @leaf.save  
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private 

  def leaf_params 
    params.require(:leaf).permit(:start_date, :end_date, :user_id)
  end 

  def set_user
    @user = User.find(params[:user_id])
  end 
end
