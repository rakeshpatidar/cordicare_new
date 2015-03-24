class VoicemsgsController < ApplicationController
  before_action :set_voicemsg, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @voicemsgs = Voicemsg.all
    respond_with(@voicemsgs)
  end

  def show
    respond_with(@voicemsg)
  end

  def new
    @voicemsg = Voicemsg.new
    respond_with(@voicemsg)
  end

  def edit
  end

  def create
    @voicemsg = Voicemsg.new(voicemsg_params)
    if @voicemsg.save
      respond_to do |format|
      format.html { redirect_to(@voicemsg, :notice => 'voicemsg was successfully created.') }
      msg = { :success => 1, :msg => "data save Success!", :data => "" }
      format.json  { render :json => msg }
    end
  else
      respond_to do |format|
      format.html { redirect_to(@voicemsg, :notice => 'voicemsg was fail to created.') }
      msg = { :success => 0, :msg => "data not save", :data => "" }
      format.json  { render :json => msg }
    end
  end
end

  def update
    @voicemsg.update(voicemsg_params)
    respond_with(@voicemsg)
  end

  def destroy
    @voicemsg.destroy
    respond_with(@voicemsg)
  end

  private
    def set_voicemsg
      @voicemsg = Voicemsg.find(params[:id])
    end

    def voicemsg_params
      params.permit(:physician, :patient_id, :voice)
    end
end
