class ApplicationController < ActionController::Base
  helper BreadcrumbHelper
  include PublicActivity::StoreController

  before_action :authenticate_user!
end
