module ApplicationHelper
  def find_first_image(str)
    regexes = [/http:\/\/media.tumblr.com.*.jpg\b/, /http:\/\/media.tumblr.com.*.png\b/, /http:\/\/media.tumblr.com.*.jpeg\b/, /http:\/\/media.tumblr.com.*.gif\b/]
    regexes.each do |regex|
      if str.match regex
        return str.match regex 
      end
    end
  end
end
