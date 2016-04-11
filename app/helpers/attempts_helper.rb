module AttemptsHelper
  def any_job_attempts?(job)
    Job.find(job.id).attempts.length > 0
  end
end
