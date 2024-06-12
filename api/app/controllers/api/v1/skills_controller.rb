class Api::V1::SkillsController < ApplicationController
  def register
    skill = Skill.new(skill_params)
    if skill.save
      render json: { skill: skill }, status: 201
    else
      render status: 400
    end
  end

  def index
    skills = Skill.all
    if skills.empty?
      render status: 400
    else
      render json: { skills: skills }, status: 200
    end
  end

  def update
    skill = Skill.find_by(id: params[:id])
    if skill.nil?
      skill = Skill.new(skill_params)
      if skill.save
        render json: { skill: skill }, status: 201
      else
        render status: 400
      end
    else
      if skill.update(skill_params)
        render json: { skill: skill }, status: 200
      else
        render status: 400
      end
    end
  end

  def delete
    skill = Skill.find_by(id: params[:id])
    if skill.nil?
      render status: 400
    else
      if skill.destroy
        render status: 204
      else
        render status: 400
      end
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
