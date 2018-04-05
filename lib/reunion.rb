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
end
