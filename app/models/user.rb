class User < ActiveRecord::Base
  validates_uniqueness_of :name, :email

  has_many :user_skills
  has_many :skills, through: :user_skills

  def proficiency_for(skill)
    UserSkill.find_by_user_id_and_skill_id(self.id, skill.id).proficiency
  end

  def set_proficiency_for(skill, value)
    user_skill = UserSkill.find_by_user_id_and_skill_id(self.id, skill.id)
    user_skill.proficiency = value
    user_skill.save
  end
  
end
