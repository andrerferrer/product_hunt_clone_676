class ApplicationController < ActionController::Base
  before_action :authenticate_user! # whitelist approach
end
