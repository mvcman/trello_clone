class ColumnsController < ApplicationController
  before_action :set_project, only: %i[new create update_color edit]
  
  def new
    @column = Column.new 
  end

  def create
    @column = @project.columns.build(columns_params)
    respond_to do |format|
      if @column.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append(@project, partial: "columns/column", locals: { column: @column })
          ]
        end
      end
    end 
  end 

  def edit
    @column = Column.find(params[:id])
  end

  def update
    @column = Column.find(params[:id])
    respond_to do |format|
      if @column.update(columns_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(@column, partial: "columns/column", locals: { column: @column })
          ]
        end
      end
    end 
  end 

  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@column)
        ]
      end 
    end 
  end 

  def update_color
    @column = Column.find(params[:column_id])
    respond_to do |format|
      if @column.update(color: params[:color])
        format.turbo_stream do 
          render turbo_stream: [
            turbo_stream.replace(@column, partial: "columns/column", locals: { column: @column })
          ]
        end
      end
    end
  end 

  private 

  def columns_params
    params.require(:column).permit(:name, :description, :color) 
  end

  def set_project
    @project = Project.find(params[:project_id]) 
  end 
end
