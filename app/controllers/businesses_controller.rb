class BusinessesController < ApplicationController
  # GET /businesses
  # GET /businesses.xml
  # GET /businesses.fxml
  def index
    if params[:last_synced]
      @businesses = Business.find(:all, :conditions => ["updated_at >= ?", Time.at(params[:last_synced].to_i).utc])
    else
      @businesses = Business.find(:all)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @businesses.to_json(:attributes => {:last_synced => Time.now.utc.to_i.to_s}) }
      format.fxml  { render :fxml => @businesses.to_fxml(:attributes => {:last_synced => Time.now.utc.to_i}) }
      format.amf  { render :amf => @businesses.to_amf(:attributes => {:last_synced => Time.now.utc.to_i}) }
    end
  end

  # GET /businesses/1
  # GET /businesses/1.xml
  # GET /businesses/1.fxml
  def show
    @business = Business.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @business }
      format.fxml { render :fxml => @business }
      format.amf  { render :amf => @business }
    end
  end

  # GET /businesses/new
  # GET /businesses/new.xml
  def new
    @business = Business.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business }
    end
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  # POST /businesses.xml
  # POST /businesses.fxml
  def create
    @business = Business.new(params[:business])

    respond_to do |format|
      if @business.save
        flash[:notice] = 'Business was successfully created.'
        format.html { redirect_to(@business) }
        format.json { render :json => @business }
        format.fxml { render :fxml => @business }
        format.amf  { render :amf => @business } 
      else
        format.html { render :action => "new" }
        format.json { render :json => @business.errors }
        format.fxml { render :fxml => @business.errors }
        format.amf  { render :amf => @business.errors }
      end
    end
  end

  # PUT /businesses/1
  # PUT /businesses/1.xml
  # PUT /businesses/1.fxml
  def update
    begin
      @business = Business.find(params[:id])
      @saved = @business.update_attributes(params[:business])
    rescue
      @business = Business.new(params[:business])
      @business.id = params[:id]
      @saved = @business.save
    end

    respond_to do |format|
      if @saved
        flash[:notice] = 'Business was successfully updated.'
        format.html { redirect_to(@business) }
        format.json  { render :json => @business }
        format.fxml { render :fxml => @business }
        format.amf  { render :amf => @business }
      else
        format.html { render :action => "edit" }
        format.fxml { render :json => @business.errors }
        format.fxml { render :fxml => @business.errors }
        format.amf  { render :amf => @business.errors }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.xml
  # DELETE /businesses/1.fxml
  def destroy
    @business = Business.find(params[:id])
    @business.destroy

    respond_to do |format|
      format.html { redirect_to(businesses_url) }
      format.json { render :json => @business }
      format.fxml { render :fxml => @business }
      format.amf  { render :amf => @business }
    end
  end
end