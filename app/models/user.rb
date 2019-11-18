class User < ApplicationRecord
  has_many :relation, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relation, foreign_key: "followed_id",
            class_name:  "Relation",
            dependent:   :destroy
  has_many :followed_users, through: :relation, source: :followed
  has_many :followers, through: :reverse_relation, source: :follower

  validates_uniqueness_of :name

  def follow!(user)
    relation.create!(followed_id: user.id)
  end

  def unfollow!(user)
    relation.find_by_followed_id(user.id).destroy
  end
end
