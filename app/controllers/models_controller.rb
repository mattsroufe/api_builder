class ModelsController < ApplicationController
  def index
    @models = Model.all
  end

  def create
    `rails g model #{model_params[:name]}`
    `bin/rake db:migrate`
    Model.create(name: model_params[:name])
    redirect_to models_path
  end

  private

  def model_params
    params.require(:model).permit(:name)
  end
end
