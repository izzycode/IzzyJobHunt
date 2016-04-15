module CompaniesHelper
  def any_companies?
    Company.all.count > 0
  end
end
