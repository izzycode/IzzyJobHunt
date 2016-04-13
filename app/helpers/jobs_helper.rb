module JobsHelper
  def this_many_current_jobs
    Job.where(user_id: current_user.id, archived: false).count
  end

  def current_jobs
    Job.where(archived: false, user_id: current_user.id)
  end
end
