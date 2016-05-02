module JobsHelper
  def this_many_current_jobs
    Job.where(user_id: current_user.id, archived: false).count
  end

  def current_jobs
    Job.where(archived: false, user_id: current_user.id)
  end

  def any_archived_jobs?
    !Job.where(archived: true, user_id: current_user.id).empty?
  end

  def get_job_title(url)
    case url
    when url.include?("indeed")
      page = HTTParty.get @job.web_address
      noko = Nokogiri::HTML page.body
      position = noko.xpath('//*[@id="job_header"]/b').first.content
    when url.include?("linkedin")
      page = HTTParty.get @job.web_address
      noko = Nokogiri::HTML page.body
      position = noko.xpath('//*[@id="top-card"]/div/div[1]/div[2]/div/div[1]/h1').first.content
    when url.include?("ziprecruiter")
      page = HTTParty.get @job.web_address
      noko = Nokogiri::HTML page.body
      position = noko.xpath('//*[@id="page-content-wrapper"]/div[2]/div[2]/div[1]/div[1]/div/div[1]/div/div[1]/h1').first.content
    end
    position
  end


end
