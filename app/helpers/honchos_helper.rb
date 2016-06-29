module HonchosHelper



  def any_company_kahunas?(company)
    if Honcho.where(company_id: company.id).count > 0
      true
    else
      false
    end
  end

  def company_kahunas(company_id)
    Honcho.where(company_id: company_id)
  end

  def user_current_kahunas
    kahunas = []
    companies = []
    user_current_jobs.each do |job|
      companies << job.company_id
    end
    companies.each do |comp|
      kahunas << Honcho.where(company_id: comp)
    end

    kahunas.flatten
  end


end
