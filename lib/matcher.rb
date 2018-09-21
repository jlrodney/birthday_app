class Matcher

  def days_until_birthday
      bday = Date.new(Date.today.year, @dob_month, @dob_day)
      if Date.today >= bday
        bday + 365
      end
      (bday - Date.today).to_i
  end

end
