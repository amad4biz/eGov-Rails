class ReportsController < ApplicationController
  require 'json'

  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show, :update, :destroy]

  def start
    ActionCable.server.broadcast('reports', Report.all)
    render json: {}, status: :ok
  end

  def index
    @reports = Report.all
  end

  def show
  end

  def edit
  end

  def create
    @report = Report.new(JSON.parse(request.body.read))

    if @report.save
      ActionCable.server.broadcast('reports', Report.all.order(created_at: :desc))

      render json: {}, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end

  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        ActionCable.server.broadcast('reports', Report.all.order(created_at: :desc))

        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :description, :status_id, :email, :image, :lat, :lng, :observation)
    end
end
