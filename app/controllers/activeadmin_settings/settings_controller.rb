class ActiveadminSettings::SettingsController < ApplicationController
  before_filter :authenticate!

  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(permitted_params[:setting])
      render :text => @object.value
    else
      render :text => "error"
    end
  end

  # Define the permitted params in case the app is using Strong Parameters
  def permitted_params
    if Rails::VERSION::MAJOR == 3 && !defined? StrongParameters
      params
    else
      params.permit setting: [:name, :string, :file, :remove_file, :locale]
    end
  end 

  private

  def authenticate!
    send ActiveAdmin.application.authentication_method 
  end
end
