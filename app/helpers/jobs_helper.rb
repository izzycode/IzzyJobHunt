module JobsHelper
  def user_current_jobs
    Job.where(user_id: current_user.id, archived: false)
  end

  def current_jobs
    Job.where(archived: false, user_id: current_user.id)
  end

  def any_archived_jobs?
    !Job.where(archived: true, user_id: current_user.id).empty?
  end

end
