module DashboardHelper
  require 'charts'
  include Charts

  def draw_active_charts
    @active_courses = Course.active
    generate_chart_data(@active_courses)
    content_tag(:div, '', id: "active-chart") + render_chart(@chart, 'active-chart')
  end

  def draw_start_soon_charts
    announced_courses = Course.start_soon
    generate_chart_data(announced_courses)
    content_tag(:div, '', id: "start_soon_chart") + render_chart(@chart, 'start_soon_chart')
  end

  def draw_finish_soon_charts
    announced_courses = Course.finish_soon
    generate_chart_data(announced_courses)
    content_tag(:div, '', id: "finish_soon_chart") + render_chart(@chart, 'finish_soon_chart')
  end

end
