class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :find_first_image

  def find_first_image(str)
    regexes = [
      /http:\/\/media.tumblr.com.*.jpg\b/,
      /http:\/\/media.tumblr.com.*.png\b/,
      /http:\/\/media.tumblr.com.*.jpeg\b/,
      /http:\/\/media.tumblr.com.*.gif\b/,
      /http:\/\/i.imgur.com.*.gif\b/,
      /http:\/\/\d+.media.tumblr.com.*.jpg\b/,
      /http:\/\/\d+.media.tumblr.com.*.png\b/,
      /http:\/\/\d+.media.tumblr.com.*.jpeg\b/,
      /http:\/\/\d+.media.tumblr.com.*.gif\b/,
      /http:\/\/i.imgur.com.*.gif\b/,
      /https:\/\/\d+.media.tumblr.com.*.jpg\b/,
      /https:\/\/\d+.media.tumblr.com.*.png\b/,
      /https:\/\/\d+.media.tumblr.com.*.jpeg\b/,
      /https:\/\/\d+.media.tumblr.com.*.gif\b/
    ]
    regexes.each do |regex|
      if str.match regex
        return str.match(regex)[0].split('src="').last
      end
    end
    nil
  end
end
