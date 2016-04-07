class User < ActiveRecord::Base
  has_many :jobs
  has_secure_password

  def many_honchos
    if Honcho.all.count > 0
      @hochos = 0
      self.jobs.each do |h|
        @honchos += h.company.honchos.count
        p @honchos
      end
    else
      "0"
    end
  end





end
