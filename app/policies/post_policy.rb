class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def edit?
    record.user_id == user.id
  end
end