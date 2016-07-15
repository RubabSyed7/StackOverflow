class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # handled by current_user

    can [:read, :create], :all
    can [:update, :destroy, :edit, :delete], Question, user_id: user.id
    can [:update, :destroy, :edit, :delete], Answer, user_id: user.id 
    can [:update, :destroy, :edit, :delete], Comment, user_id: user.id
    can :accept, Answer do |answer|
      answer.question.user == user
    end
  end

end
