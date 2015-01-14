class Course < ActiveRecord::Base

  scope :active, -> { where(state: ['active']) }
  scope :start_soon, -> {where('start_date >= ?', Date.today).where('start_date <= ?', Date.today.end_of_month)}
  scope :finish_soon, -> {where('end_date >= ?', Date.today).where('end_date <= ?', Date.today.end_of_month)}

  def self.sync
    courses_list = get_remote_courses_list
    courses_list.each do |course_data|
      course = find_or_create_by(course_id: course_data['id'].to_i)
      course.update_attributes(course_data.except('id'))
    end
    all
  end

  def self.get_remote_courses_list
    url = APP_CONFIG['url']
    response = RestClient.get url
    Array(JSON.parse(response)['courses'])
  end
end
