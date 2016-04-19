module CompaniesHelper

  def any_companies?
    user_companies.all.count > 0
  end

end
