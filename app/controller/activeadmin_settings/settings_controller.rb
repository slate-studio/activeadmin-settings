class ActiveadminSettings::SettingsController < ApplicationController
  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(params[:setting])
      render :text => @object.value
    else
      render :text => "error"
    end
  end
end