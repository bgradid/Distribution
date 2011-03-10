class TechniciansController < ApplicationController
  # GET /technicians
  # GET /technicians.xml
  def index
    @technicians = Technician.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @technicians }
    end
  end

  # GET /technicians/1
  # GET /technicians/1.xml
  def show
    @technician = Technician.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technician }
    end
  end

  # GET /technicians/new
  # GET /technicians/new.xml
  def new
    @technician = Technician.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @technician }
    end
  end

  # GET /technicians/1/edit
  def edit
    @technician = Technician.find(params[:id])
  end

  # POST /technicians
  # POST /technicians.xml
  def create
    @technician = Technician.new(params[:technician])

    respond_to do |format|
      if @technician.save
        format.html { redirect_to(@technician, :notice => 'Technician was successfully created.') }
        format.xml  { render :xml => @technician, :status => :created, :location => @technician }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @technician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /technicians/1
  # PUT /technicians/1.xml
  def update
    @technician = Technician.find(params[:id])

    respond_to do |format|
      if @technician.update_attributes(params[:technician])
        format.html { redirect_to(@technician, :notice => 'Technician was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technicians/1
  # DELETE /technicians/1.xml
  def destroy
    @technician = Technician.find(params[:id])
    @technician.destroy

    respond_to do |format|
      format.html { redirect_to(technicians_url) }
      format.xml  { head :ok }
    end
  end
end
