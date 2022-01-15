class SkillsController < ApplicationController

  access all: [], user: [], site_admin: :all

  def index
    @skill = Skill.all
  end

  def new
    @skill = Skill.new()
  end

  def create
    @skill= Skill.new(required_parameters)
    if @skill.save
      flash[:alert] = "Skill added sucessfully"
      redirect_to(:controller => 'skills', :action => 'index')
    else
      flash[:alert] = "Error, could not add the skill"
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(required_parameters)
      flash[:alert] = "Skill's information sucessfully updated"
      redirect_to(:action => 'show', :id => @skill.id)
    else
      flash[:error] = "There is a problem with updating information"
      render('edit')
    end
  end

  def delete
    @skill = Skill.find(params[:id])
  end


  private

    def required_parameters
      params.require(:skill).permit(:skillName, :skillKnowledge)
    end

end
