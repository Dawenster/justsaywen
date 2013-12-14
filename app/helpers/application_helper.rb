module ApplicationHelper
  def remove_first_image(str)
    doc = Nokogiri::HTML(str)
    doc.search('.//img').first.remove if doc.search('.//img').first
    return doc.to_html
  end

  def minutes_to_read(str)
    arbitrary_words_per_minute = 200
    minutes = (str.split.size.to_f / arbitrary_words_per_minute).ceil
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

  def generate_meta_tags(section, title, image, description)
    full_title = "#{title ? title : section} - by David Wen"
    full_description = "#{minutes_to_read(description) + ' ⋅ ' if title}#{truncate_html(description, length: 250)}"

    meta :title => full_title, :description => full_description
    meta [:property => "og:image", :content => image] unless image.blank?
    meta [:property => "og:title", :content => full_title]
    meta [:property => "og:url", :content => request.original_url]
    meta [:property => "og:description", :content => full_description]
  end
end
