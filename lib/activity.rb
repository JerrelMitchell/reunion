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

  def split_costs
    even_stevens = (total_cost / participants.size)
    @participants.transform_values! do
      even_stevens
    end
  end

  def unsettled_amount(person)
    even_stevens = (total_cost / participants.size)
    participants.values_at(person)[0] - even_stevens
  end
end
