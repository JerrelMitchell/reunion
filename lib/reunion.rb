class Reunion
  attr_reader :location
  def initialize(location)
    @location = location
    @activities = []
  end

  def activities
    @activities.map(&:name)
  end

  def add_activity(activity)
    @activities << activity
  end

  def absolute_cost
    @activities.map(&:total_cost).sum
  end

  def list_unsettled_amounts(person)
    @activities.map do |activity|
      activity.unsettled_amount(person)
    end.compact
  end

  def absolute_unsettled_amount(person)
    list_unsettled_amounts(person).sum
  end
end
