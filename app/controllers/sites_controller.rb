class SitesController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!
  expose(:sites) { current_user.sites }
  expose(:site)

  def index
    respond_with sites
  end

  def show
    respond_with site
  end

  def new
    respond_with site
  end

  def edit
    respond_with site
  end

  def create
    if site.save
      flash.notice = 'Site was created successfully.'
    end
    respond_with site
  end

  def update
    if site.save
      flash.notice = 'Site was updated successfully.'
    end
    respond_with site
  end

  def destroy
    site.destroy
    respond_with site
  end
end
