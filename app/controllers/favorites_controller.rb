class FavoritesController < ApplicationController
  def create
    project = Project.where(id: params[:project_id]).first
    fp = FavoriteProject.first_or_initialize(user: current_user, project: project)
    fp.removed = false

    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end

  def remove
    fp = FavoriteProject.find(params[:id])
    fp.removed = true

    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end

end
