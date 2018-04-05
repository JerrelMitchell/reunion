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

  def split_cost
    even_stevens = (total_cost / participants.size)
    @participants.update(participants) do |person, paid|
      paid = even_stevens
    end
  end
end
