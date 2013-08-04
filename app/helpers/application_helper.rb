module ApplicationHelper

  def full_name(user_id)
    user = User.find_by_id(user_id)
    full_name = "#{user.first_name}" "#{user.last_name}"
  end
end
