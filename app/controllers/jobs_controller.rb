class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

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




  def autofill
    @job = Job.new(job_params)
    response = HTTParty.get @job.web_address
    noko = Nokogiri::HTML response.body
    if @job.web_address.include?('indeed.com')
      company = noko.xpath('//*[@id="job_header"]/span[1]').first.content
      position = noko.xpath('//*[@id="job_header"]/b/font').first.content
    # elsif @job.web_address.include?('angel.io')
    #   company = noko.xpath('//*[@id="top-card"]/div/div[1]/div[2]/h3[1]/a/span[1]').first
    #   position = noko.css('.title').text
    elsif @job.web_address.include?('ziprecruiter.com')
      company = noko.css('.job_details_icon > span')
      position = noko.css('.job_header h1').text
      # position = noko.xpath('//*[@id="page-content-wrapper"]/div[2]/div[1]/div[2]/div/div/div/div/div[1]/h1').first.content
    else
      company = "Couldn't autofill this information, please paste company name here."
      position = "Couldn't autofill this information, please paste position title here."
    end


    p "<>"*47
    p company
    p position

    @job.position = position
    @company = Company.create(name:company)
    @job.company_id = @company.id
    @job.save

    redirect_to edit_job_path(@job,@company), notice: 'Please verify the information obtained from the website.'

  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to current_user, notice: 'Job was successfully created.' }
        format.js { flash[:notice] = "Company successfully added"}
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to current_user, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Job was successfully destroyed.' }
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
