class UserPolicy < ApplicationPolicy
  def unsubscribe?
    record.id == user.id
  end
end