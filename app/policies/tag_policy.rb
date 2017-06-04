class TagPolicy < ApplicationPolicy
  attr_reader :user, :tag

  def initialize(user, tag)
    @user = user
    @tag = tag
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
