class ActiveadminSettings::AdminUsersController < ApplicationController
  before_filter :authenticate!

  def update
    @object = AdminUser.find(params[:id])
    if @object.update_attributes(permitted_params[:admin_user])
      render :text => "ok"
    else
      render :text => @object.errors.to_json, :status => :unprocessable_entity
    end
  end

  def create
    @object = AdminUser.new(permitted_params[:admin_user])
    if @object.save
      render :partial => "admin/settings/admin", :locals => {:admin => @object}, :layout => false
    else
      render :text => @object.errors.to_json, :status => :unprocessable_entity
    end
  end

  def destroy
    @object = AdminUser.find(params[:id])
    @object.destroy
    redirect_to "/admin/settings#admins"
  end

  # Define the permitted params in case the app is using Strong Parameters
  def permitted_params
    if Rails::VERSION::MAJOR == 3 && !defined? StrongParameters
      params
    else
      params.permit admin_user: [:email, :password, :password_confirmation]
    end
  end 

  private

  def authenticate!
    send ActiveAdmin.application.authentication_method 
  end
end
