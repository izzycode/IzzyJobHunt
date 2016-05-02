module HonchosHelper



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

  def user_current_kahunas
    kahunas = []
    current_user.companies.each do |comp|
      kahunas << Honcho.where(company_id: comp.id)
    end

    kahunas.flatten
  end


end
