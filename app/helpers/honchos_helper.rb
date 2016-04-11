module HonchosHelper

  def user_kahunas
    companies = []
    current_user.jobs.each do |j|
      companies << j.company
    end
    kahunas = []
    companies.each do |c|
      kahunas << Honcho.find_by(company_id: c)
    end
    return kahunas
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
