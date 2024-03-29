class EventsController < ApplicationController
  skip_before_action :authorize, except: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(status: true)
  end
  
  def upcoming
    @events = Event.where("end_date >= ?", Date.today).order(:start_date)
  end

  def past
    @events = Event.where('end_date < ?', Date.today).order(start_date: :desc)
  end

  def myevents
    if session[:user_id].nil?
      redirect_to root_url, notice: 'Please Log in First'
    else  
      user = User.find(session[:user_id])
      @events = user.events
    end
  end
  # GET /events/1
  # GET /events/1.json
  def show
  end
  
  def search
    if params[:search].blank?
      @events = Event.all
    else
      @events = Event.where("name LIKE ? OR city LIKE ? OR country LIKE ?", 
        params[:search], params[:search],
        params[:search]) 
    end
  end
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @user = User.find(session[:user_id])
    @event = @user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :user_id, :start_date, :end_date, :start_time, :end_time, :address, :city, :country, :contact_details, :description, :status, :image_url)
    end
end
