class FavoriteProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates_uniqueness_of :project_id, :scope => :user_id

  scope :active, -> { where(removed: false) }
  scope :removed, -> { where(removed: true) }

  def self.created_between(start_date, end_date)
    where("created_at >= ? AND created_at <= ?", start_date, end_date)
  end
end
