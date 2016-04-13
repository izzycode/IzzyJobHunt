module HonchosHelper

  def user_current_kahunas
    current_user_jobs = Job.where(user_id: current_user.id, archived: false)
    companies = []
    current_user_jobs.each do |j|
      companies << j.company
    end
    kahunas = []
    companies.each do |c|
      kahunas << c.honchos
    end
    kahunas
  end

  def any_company_kahunas?(company)
    if Honcho.where(company_id: company.id).count > 0
      true
    else
      false
    end
  end

  def company_kahunas(company)
    Honcho.where(company_id: company.id)
  end


end
