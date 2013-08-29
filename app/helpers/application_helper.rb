module ApplicationHelper

  def full_name(user_id)
    user = User.find_by_id(user_id)
    full_name = "#{user.first_name} " "#{user.last_name}"
  end

  def discussion_group(group_id)
    discussion_group = Group.find_by_id(group_id)
		link_to discussion_group.name, discussion_group
  end
  
  #unsimple format has been used to remove the default <p> that simple_format adds in when displaying text
  def unsimple_format(text)
    text.gsub(/\r\n?/, "\n").split(%r{(\n*(?:<h4>.*?</h4>|<blockquote(?: .*?)?>.*?</blockquote>)\n*)}im).map do |part|
      case part
      when /\A\s*\Z/, /<h4>/
        part
      when /blockquote/
        part.sub(%r{(<blockquote(?: .*?)?>)(.*?)(</blockquote>)}im) { $1 + simple_format($2) + $3 }
      else
        simple_format(part)
      end
    end.join
  end

end
