class PagesController < ApplicationController
  before_action :require_user
  def live
    @reports = Report.all
  end
end
