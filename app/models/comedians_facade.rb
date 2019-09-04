class ComediansFacade
  attr_reader :comedians

  def initialize(comedians)
    @comedians = comedians
  end

  def average_age
    Comedian.average_age(comedian_ids)
  end

  def cities
    Comedian.list_of_cities(comedian_ids)
  end

  def specials_count
    Special.specials_count(comedian_ids)
  end

  def avg_run_time
    Special.avg_run_time(comedian_ids)
  end

  private

  def comedian_ids
    comedians.map {|com| com.id}
  end
end
