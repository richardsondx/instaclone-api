class User < ApplicationRecord
  has_many :relation, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relation, foreign_key: 'followed_id',
           class_name:  'Relation',
           dependent:   :destroy
  has_many :followed_users, through: :relation, source: :followed
  has_many :followers, through: :reverse_relation, source: :follower

  validates_uniqueness_of :username

  def follow!(user)
    return false if self.id == user.id
    return false if following?(user)
    relation.create!(followed_id: user.id)
  end

  def unfollow!(user)
    user_to_unfollow = relation.find_by_followed_id(user.id)
    return false unless user_to_unfollow.present?
    user_to_unfollow.destroy
  end

  def following?(user)
    relation.find_by(followed_id: user.id)
  end
end
