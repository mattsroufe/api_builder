class ModelsController < ApplicationController
  def index
    Rails.application.eager_load!
    @models = ApplicationRecord.descendants
    @output = {foo: 'bar', hello: 'world'}
  end

  def create
    create_model(model_params[:name], model_params[:attributes])
    redirect_to models_path
  end

  private

  def model_params
    params.require(:model).permit(:name, attributes: [:name, :type])
  end

  def create_model(name, attributes)
    attributes_string = attributes.map do |attr|
      key, type = attr.values
      [key, type].join(':') if key.present?
    end.compact.join(' ')
    `rails g model #{name} #{attributes_string}`
    `rake db:migrate`
  end
end
