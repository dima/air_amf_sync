class PeopleController < ApplicationController
  # GET /people
  # GET /people.xml
  # GET /people.fxml
  def index
    if params[:last_synced]
      @people = Person.find(:all, :conditions => ["updated_at >= ?", Time.at(params[:last_synced].to_i).utc])
    else
      @people = Person.find(:all)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @people.to_json(:attributes => {:last_synced => Time.now.utc.to_i.to_s}) }
      format.fxml  { render :fxml => @people.to_fxml(:attributes => {:last_synced => Time.now.utc.to_i}) }
      format.amf  { render :amf => @people.to_amf(:attributes => {:last_synced => Time.now.utc.to_i}) }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  # GET /people/1.fxml
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
      format.fxml  { render :fxml => @person }
      format.amf  { render :amf => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.xml
  # POST /people.fxml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        flash[:notice] = 'Person was successfully created.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
        format.fxml  { render :fxml => @person }
        format.amf  { render :amf => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @person.errors }
        format.amf  { render :amf => @person.errors }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  # PUT /people/1.fxml
  def update
    begin
      @person = Person.find(params[:id])
      @saved = @person.update_attributes(params[:person])
    rescue
      @person = Person.new(params[:person])
      @person.id = params[:id]
      @saved = @person.save
    end

    respond_to do |format|
      if @saved
        flash[:notice] = 'Person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @person }
        format.amf  { render :amf => @person }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @person.errors }
        format.amf  { render :amf => @person.errors }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  # DELETE /people/1.fxml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @person }
      format.amf  { render :amf => @person }
    end
  end
end