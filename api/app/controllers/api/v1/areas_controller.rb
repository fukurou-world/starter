class Api::V1::AreasController < ApplicationController
  def create
    area = Area.new(area_params)
    if !area.blank? && !area['name'].blank? && area.save
      render json: area, status: :created
    else
      render json: { error: 'Invalid Request' }, status: :unprocessable_entity
    end
  end

  def index
    @areas = Area.all
    if @areas.empty?
      render json: { error: 'Not Found' }, status: :not_found
    else
      render :index, format: 'json', handler: 'jbuilder'
    end
  end

  def update
    id = params[:id]
    if id.nil?
      render json: { error: 'Bad Request' }, status: :bad_request and return
    end

    area = Area.find(id)
    if area.nil?
      render json: { error: 'Not Found' }, status: :not_found
    else
      if area.update(area_params)
        render json: area, status: :ok
      else
        render json: { error: 'Bad Request' }, status: :bad_request
      end
    end
  end

  def delete
    id = params[:id]
    if id.nil?
      render json: { error: 'Bad Request' }, status: :bad_request and return
    end

    area = Area.find(id)
    if area.nil?
      render json: { error: 'Not Found' }, status: :not_found
    else
      if area.destroy
        # 204のため、実際は空
        render json: { id: id }, status: :no_content
      else
        render json: { error: 'Bad Request' }, status: :bad_request
      end
    end
  end

  private
  def area_params
    params.permit(:name)
  end
end