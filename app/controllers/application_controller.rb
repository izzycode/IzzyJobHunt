class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  include SessionsHelper
  include HonchosHelper
  include AttemptsHelper
  include JobsHelper
  include ApplicationHelper
  include CompaniesHelper
  include UsersHelper







end
