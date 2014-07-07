class VersionsController < ApplicationController
  before_action :set_notebook_version
  def show 
  end 

  def set_notebook_version
    @notebook = Notebook.find(params[:notebook_id])
    @version = @notebook.versions.where(id: params[:id]).first
  end
end