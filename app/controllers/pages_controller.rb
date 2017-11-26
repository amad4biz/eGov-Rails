class PagesController < ApplicationController
  before_action :require_user
  def live
    ActionCable.server.broadcast('reports', Report.all.order(created_at: :desc))
    @reports = Report.all.where(status_id: 1).order(created_at: :desc)
  end
end
