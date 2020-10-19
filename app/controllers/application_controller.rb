class ApplicationController < ActionController::Base
  helper BreadcrumbHelper

  before_action :authenticate_user!
end
