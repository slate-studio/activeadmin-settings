class ActiveadminSettings::AdminUsersController < ApplicationController
  before_filter :authenticate_admin_user!

  def update
    @object = AdminUser.find(params[:id])
    if @object.update_attributes(params[:admin_user])
      render :text => "ok"
    else
      render :text => @object.errors.to_json, :status => :unprocessable_entity
    end
  end

  def create
    @object = AdminUser.new(params[:admin_user])
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
end