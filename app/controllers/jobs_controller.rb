class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:index]

  # GET /jobs
  # GET /jobs.json
  def index
    if params[:archived] == "true"
      @jobs = Job.where(archived: true, user_id: current_user.id)
      render '/jobs/archives'
    else
      @jobs = current_user.jobs
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # Grabs Job.position and Company.name from provided url only for indeed and ziprecruiter
  def create
    @job = Job.new(job_params)
    response = HTTParty.get @job.web_address
    noko = Nokogiri::HTML response.body
    if @job.web_address.include?('indeed.com')
      company = noko.xpath('//*[@id="job_header"]/span[1]').first.content
      position = noko.xpath('//*[@id="job_header"]/b/font').first.content
    elsif @job.web_address.include?('ziprecruiter.com')
      company = noko.css('span[itemprop="name"]').text
      position = noko.css('.job_header h1').text
    else
      company = "Couldn't autofill this information, please paste company name here."
      position = "Couldn't autofill this information, please paste position title here."
    end

    p "<>"*47
    p company
    p position
    p session[:userinfo].info
    
    @job.position = position
    @job.create_company(name:company)
    @job.save
    current_user.jobs << @job

    redirect_to edit_job_path(@job), notice: 'Please verify the information obtained from the website.'

  end

  # GET /jobs/new
  def new
    @job = Job.new
    if current_user.jobs.first.nil?
      gon.tour2 = 2
    end
  end

  # GET /jobs/1/edit
  def edit
    if current_user.jobs.first.created_at > Time.now-4.seconds
      gon.tour3 = 3
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if @job.update(job_params)
      @job.create_company(name:params[:job][:name])
      redirect_to current_user, notice: 'Job was successfully updated.'
    else
      redirect_to current_user, error: "Something went wrong, let's go ahead and try that again"
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Job was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:position, :web_address, :user_id, :company_id, :archived)
    end
end
