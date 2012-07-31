class ActiveadminSettings::SettingsController < ApplicationController
  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(params[:setting])
      render :text => "ok"
    else
      render :text => "error"
    end
  end
end