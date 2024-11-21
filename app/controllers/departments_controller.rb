class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]
  def index
    @departments = Department.all
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private 
  def set_department
    @department = Department.find(params[:id]) 
  end 
end
