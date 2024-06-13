class Api::V1::AreasController < ApplicationController
  def register
    area = Area.new(area_params)
    if area.save
      render json: { area: area }, status: 201
    else
      render status: 400
    end
  end

  def index
    areas = Area.all
    if areas.empty?
      render status: 400
    else
      render json: { areas: areas }, status: 200
    end
  end

  def update
    area = Area.find_by(id: params[:id])
    if area.nil?
      area = Area.new(area_params)
      if area.save
        render json: { area: area }, status: 201
      else
        render status: 400
      end
    else
      if area.update(area_params)
        render json: { area: area }, status: 200
      else
        render status: 400
      end
    end
  end

  def delete
    area = Area.find_by(id: params[:id])
    if area.nil?
      render status: 400
    else
      if area.destroy
        render status: 204
      else
        render status: 400
      end
    end
  end

  private
  def area_params
    params.require(:area).permit(:name)
  end
end