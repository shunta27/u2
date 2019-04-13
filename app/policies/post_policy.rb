class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def edit?
    user.present? && record.user_id == user.id
  end
end