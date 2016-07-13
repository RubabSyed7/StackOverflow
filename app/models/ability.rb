class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # handled by current_user

    can [:update, :destroy], Question, user_id: user.id
    can [:update, :destroy], Answer, user_id: user.id 
    can :accept, Answer do |answer|
    	answer.question.user == user 
    end
  end

end
