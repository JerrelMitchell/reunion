class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, paid)
    @participants[person] = paid
  end

  def total_cost
    @participants.values.sum
  end

  def unsettled_amount(person)
    even_stevens = (total_cost / participants.size)
    unless participants.values_at(person)[0].nil?
      participants.values_at(person)[0] - even_stevens
    end
  end
end
