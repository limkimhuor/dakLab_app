class ManagerApplicationController < ApplicationController
  before_action :authenticate_manager!
end
