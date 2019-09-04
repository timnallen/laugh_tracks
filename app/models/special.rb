class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name, :runtime

  def self.specials_count(com_ids)
    where(comedian_id: com_ids).count
  end

  def self.avg_run_time(com_ids)
    where(comedian_id: com_ids).average(:runtime)
  end
end
