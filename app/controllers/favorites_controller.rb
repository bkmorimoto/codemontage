class FavoritesController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    fp = FavoriteProject.first_or_initialize(user: current_user, project: project)
    fp.removed = false

    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end

  def remove
    project = Project.find(params[:project_id])
    fp = FavoriteProject.where(user_id: current_user.id, project_id: project.id).first
    fp.removed = true

    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end

end
