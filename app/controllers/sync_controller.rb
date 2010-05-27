class SyncController < ApplicationController
  def pull
    target = params[:model].singularize.capitalize.constantize
    
    if params[:last_synced]
      @results = target.find(:all, :conditions => ["updated_at >= ?", Time.at(params[:last_synced].to_i).utc])
    else
      @results = target.find(:all)
    end
    
    respond_to do |format|
      format.json { render :json => @results }
      format.amf  { render :amf => @results.to_amf(:attributes => {:last_synced => Time.now.utc.to_i}) }
      format.fxml { render :fxml => @results.to_fxml(:attributes => {:last_synced => Time.now.utc.to_i}) }
    end
  end
end
