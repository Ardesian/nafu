module TimeHelper
  def pluralize(count, str)
    count == 1 ? "#{count} #{str.singularize}" : "#{count} #{str.pluralize}"
  end

  def duration_in_words(diff_seconds, group_count=1)
    return "N/A" if duration.to_i.zero?
    diff_seconds = diff_seconds.to_i

    diff_months = diff_seconds / 1.month.to_i
    diff_seconds -= diff_months

    diff_days = diff_seconds / 1.day.to_i
    diff_seconds -= diff_days

    diff_hours = diff_seconds / 1.hour.to_i
    diff_seconds -= diff_hours

    diff_minutes = diff_seconds / 1.minute.to_i
    diff_seconds -= diff_minutes

    [
      pluralize(diff_months, "month"),
      pluralize(diff_days, "day"),
      pluralize(diff_hours, "hour"),
      pluralize(diff_minutes, "minute"),
      pluralize(diff_seconds, "second")
    ].reject { |time_str|
      time_str[/^\d+/].to_i.zero?
    }.first(group_count).to_sentence
  end
end
