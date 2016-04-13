module JobsHelper
  def this_many_current_jobs
    Job.where(user_id: current_user.id, archived: false).count
  end
end
