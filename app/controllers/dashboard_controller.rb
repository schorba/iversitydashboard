class DashboardController < ApplicationController

  before_action :set_course, only: [:show]

  def index
  end

  def start_soon_charts
  end

  def start_soon
  end

  def finish_soon
  end

  def finish_soon_charts
  end

  def active_charts
  end

  def sync
    Course.sync
    redirect_to dashboard_index_path
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
