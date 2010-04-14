class UniversesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  # GET /universes
  # GET /universes.xml
  def index
    @universes = Universe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @universes }
    end
  end

  # GET /universes/1
  # GET /universes/1.xml
  def show
    @universe = Universe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @universe }
    end
  end

  # GET /universes/new
  # GET /universes/new.xml
  def new
    @universe = Universe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @universe }
    end
  end

  # GET /universes/1/edit
  def edit
    @universe = Universe.find(params[:id])
  end

  # POST /universes
  # POST /universes.xml
  def create
    @universe = Universe.new(params[:universe])

    respond_to do |format|
      if @universe.save
        flash[:notice] = 'Universe was successfully created.'
        format.html { redirect_to(@universe) }
        format.xml  { render :xml => @universe, :status => :created, :location => @universe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @universe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /universes/1
  # PUT /universes/1.xml
  def update
    @universe = Universe.find(params[:id])

    respond_to do |format|
      if @universe.update_attributes(params[:universe])
        flash[:notice] = 'Universe was successfully updated.'
        format.html { redirect_to(@universe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @universe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /universes/1
  # DELETE /universes/1.xml
  def destroy
    @universe = Universe.find(params[:id])
    @universe.destroy

    respond_to do |format|
      format.html { redirect_to(universes_url) }
      format.xml  { head :ok }
    end
  end
end
