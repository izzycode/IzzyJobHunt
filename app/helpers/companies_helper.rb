module CompaniesHelper

  def user_companies
    Company.where(user_id: current_user.id)
  end

  def any_companies?
    user_companies.all.count > 0
  end
  
end
