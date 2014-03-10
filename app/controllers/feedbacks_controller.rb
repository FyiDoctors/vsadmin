class FeedbacksController < ApplicationController
  require 'mandrill'
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        m = Mandrill::API.new # All official Mandrill API clients will automatically pull your API key from the environment

        body = "<h2>Feedback received from Vision Source Fee Site.</h2> \
        <br> \
        <p>A piece of feedback was submitted to site.</p> \
        <br> \
        <p>From: " + @feedback.email + "</p> \
        <p>Type: " + @feedback.feedback_type + "</p> \
        <p>Content: " + @feedback.content + "</p> \
        <p>Browser: " + @feedback.browser + "</p> \
        <br>"
        
        distros = Distribution.all
        recipients = Array.new
        i = 1
        distros.each do |d|
          recipients[i] = {"email"=> d.email, "type"=>"to"}
          i = i + 1
        end
        
        message = {"html"=>body,
               "text"=>"text email todo",
               "subject"=>"Feedback Received for Vision Source Fee Site",
               "from_email"=>"fee-feedback@visionsourc.ca",
               "from_name"=>"Vision Source Canada - Fees",
               "to"=> recipients,
               "headers"=>{"Reply-To"=>"fee-feedback@visionsourc.ca"},
               "important"=>false,
               "track_opens"=>nil,
               "track_clicks"=>nil,
               "auto_text"=>nil,
               "auto_html"=>nil,
               "inline_css"=>nil,
               "url_strip_qs"=>nil,
               "preserve_recipients"=>nil,
               "view_content_link"=>nil,
               "tracking_domain"=>nil,
               "signing_domain"=>nil,
               "return_path_domain"=>nil,
               "metadata"=>{"website"=>"www.visionsource.ca"},
               "recipient_metadata"=>
                  [{"rcpt"=>"dean.skelton@gmail.com", "values"=>{"user_id"=>123456}},
                  {"rcpt"=>"dean.skelton@fyidoctors.com", "values"=>{"user_id"=>123456}}]}

              async = false
              ip_pool = "Main Pool"
              send_at = nil
              logger.debug(message.to_s)
              result = m.messages.send message, async, ip_pool, send_at
              logger.debug(result)
        
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feedback }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:content, :feedback_type, :email, :browser)
    end
end
