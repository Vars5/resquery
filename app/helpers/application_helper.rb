module ApplicationHelper

  def full_name(user_id)
    user = User.find_by_id(user_id)
    full_name = "#{user.first_name} " "#{user.last_name}"
  end

  def discussion_group(group_id)
    discussion_group = Group.find_by_id(group_id)
		link_to discussion_group.name, discussion_group
  end

end
