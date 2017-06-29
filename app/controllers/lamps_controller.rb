require 'mqtt'

class LampsController < ApplicationController
  before_action :set_lamp, only: [:show, :edit, :update, :destroy, :toggle]

  # GET /lamps
  # GET /lamps.json
  def index
    @lamps = Lamp.all
  end

  # GET /lamps/1
  # GET /lamps/1.json
  def show
    client = MQTT::Client.connect(
    	host: 'iot.eclipse.org',
    	port: 1883
    	# ssl: true
    )

    topic = "cmnd/sonoff/POWER"

    payload = @lamp.state ? 'ON' : 'OFF'

    # Publish to the topic
    client.publish(topic,  payload,  retain=false,  qos=1)
  end

  # GET /lamps/new
  def new
    @lamp = Lamp.new
  end

  # GET /lamps/1/edit
  def edit
  end

  # POST /lamps/1/toggle
  # POST /lamps/1/toggle.json
  def toggle
    respond_to do |format|
      new_state = !@lamp.state

      if @lamp.update(state: new_state)
        format.html { redirect_to @lamp, notice: 'Lamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lamp }
      else
        format.html { render :edit }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /lamps
  # POST /lamps.json
  def create
    @lamp = Lamp.new(lamp_params)

    respond_to do |format|
      if @lamp.save
        format.html { redirect_to @lamp, notice: 'Lamp was successfully created.' }
        format.json { render :show, status: :created, location: @lamp }
      else
        format.html { render :new }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lamps/1
  # PATCH/PUT /lamps/1.json
  def update
    respond_to do |format|
      if @lamp.update(lamp_params)
        format.html { redirect_to @lamp, notice: 'Lamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lamp }
      else
        format.html { render :edit }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lamps/1
  # DELETE /lamps/1.json
  def destroy
    @lamp.destroy
    respond_to do |format|
      format.html { redirect_to lamps_url, notice: 'Lamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lamp
      @lamp = Lamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lamp_params
      params.require(:lamp).permit(:state)
    end
end
