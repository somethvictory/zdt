class DateTimeManager
  attr_reader :date_time

  def initialize(date_time)
    @date_time = DateTime.parse(date_time)

    @date = @date_time.strftime('%A')
    @hour = @date_time.strftime('%H').to_i
  end

  def weekdays?
    (@date == 'Monday' || @date == 'Tuesday' || @date == 'Wednesday' || @date == 'Thursday' || @date == 'Friday')
  end

  def everyday?
    weekdays? || (@date == 'Saturday') || (@date == 'Sunday')
  end

  def busy_hour?
    ((@hour >= 6 && @hour <= 9) || (@hour >= 18 && @hour <= 21))
  end

  def night_hour?
    @hour >= 22 || @hour <= 6
  end
end
