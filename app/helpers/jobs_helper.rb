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

  def grab_website
  end

  def grab_position
  end

  def grab_company
  end

end
