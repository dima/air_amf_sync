class SyncController < ApplicationController
  def pull
    @businesses = Business.all
    
    respond_to do |format|
      format.json { render :json => @businesses }
    end
  end
end
