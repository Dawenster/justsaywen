module ApplicationHelper
  def find_first_image(str)
    regexes = [/http:\/\/media.tumblr.com.*.jpg\b/, /http:\/\/media.tumblr.com.*.png\b/, /http:\/\/media.tumblr.com.*.jpeg\b/, /http:\/\/media.tumblr.com.*.gif\b/]
    regexes.each do |regex|
      if str.match regex
        return str.match regex
      end
    end
  end

  def minutes_to_read(str)
    arbitrary_words_per_minute = 200
    minutes = str.split.size / arbitrary_words_per_minute
    if minutes == 0
      return "Less than 1 min read"
    else
      return "#{minutes} min read"
    end
  end

  def blog_date(str)
    date = Date.strptime(str, "%Y-%m-%d %H:%M:%S %z")
    return date.strftime("%b %d, %Y")
  end
end
