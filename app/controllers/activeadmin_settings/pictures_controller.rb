class ActiveadminSettings::PicturesController < ApplicationController
  before_filter :authenticate_admin_user!

  def index
    @pictures = ActiveadminSettings::Picture.all
    render :json => @pictures
  end

  def create
    @picture = ActiveadminSettings::Picture.new
    @picture.data = params[:file]

    if @picture.save
      render :json => { :filelink => @picture.url }
    else
      render :nothing => true
    end
  end
end
