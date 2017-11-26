class ReportsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "reports"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
