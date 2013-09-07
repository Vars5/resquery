module ApplicationHelper

  def full_name(user_id)
    user = User.find_by_id(user_id)
    full_name = "#{user.first_name} " "#{user.last_name}"
  end

  def discussion_group(group_id)
    discussion_group = Group.find_by_id(group_id)
		link_to discussion_group.name, discussion_group
  end
  
  #removes the default <p> that's added
  def resquery_format(text, html_options={}, options={})
      text = '' if text.nil?
      text = text.dup
      start_tag = tag('div', html_options, true)
      text = sanitize(text) unless options[:sanitize] == false
      text = text.to_str
      text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
      text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")  # 2+ newline  -> paragraph
      text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
      text.insert 0, start_tag
      text.html_safe.safe_concat("</div>")
    end

end
