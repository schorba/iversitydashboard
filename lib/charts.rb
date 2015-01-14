module Charts

  def generate_chart_data(courses)
    #binding.pry
    data_table = GoogleVisualr::DataTable.new

    data_table.new_column('string', 'Term', 'tooltip')
    data_table.new_column('string', 'Name', 'tooltip')
    data_table.new_column('date', 'Start')
    data_table.new_column('date', 'End')

    courses.each do |c|
      data_table.add_rows([
                              ['Runtime', c.title, c.start_date.to_date, c.end_date.to_date]])

      option = {width: 1400, height: 1000, title: 'Massive Online  Open  Courses'}
      @chart = GoogleVisualr::Interactive::Timeline.new(data_table, option)
    end
  end

end
