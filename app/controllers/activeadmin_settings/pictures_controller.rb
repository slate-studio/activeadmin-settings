class ActiveadminSettings::PicturesController < ApplicationController
  before_filter :authenticate!

  def index
    @pictures = ActiveadminSettings::Picture.all
    render :json => @pictures
  end

  def create
    @picture = ActiveadminSettings::Picture.new
    @picture.data = permitted_params[:file]

    if @picture.save
      render :json => { :filelink => @picture.url }
    else
      render :nothing => true
    end
  end

  # Define the permitted params in case the app is using Strong Parameters
  def permitted_params
    if Rails::VERSION::MAJOR == 3 && !defined? StrongParameters
      params
    else
      params.permit :file
    end
  end 

  private

  def authenticate!
    send ActiveAdmin.application.authentication_method 
  end
end
