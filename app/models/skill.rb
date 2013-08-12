class Skill < ActiveRecord::Base
  validates_uniqueness_of :name, :context

  has_many :user_skills
  has_many :users, through: :user_skills
  
  def user_with_proficiency(value)
    user_id = UserSkill.find_by_proficiency(value).user_id
    User.find(user_id)
  end

end
