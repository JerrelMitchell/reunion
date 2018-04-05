require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new('Estes Park')
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_location
    reunion = Reunion.new('Estes Park')
    assert_equal 'Estes Park', reunion.location
  end

  def test_it_starts_with_no_activities
    reunion = Reunion.new('Estes Park')
    assert_equal [], reunion.activities
  end

  def test_it_can_add_new_activities
    reunion = Reunion.new('Estes Park')
    hiking = Activity.new('Hiking')
    skiing = Activity.new('Skiing')
    reunion.add_activity(hiking)
    assert_equal ['Hiking'], reunion.activities
    reunion.add_activity(skiing)
    assert_equal %w[Hiking Skiing], reunion.activities
  end

  def test_it_can_find_absolute_cost_of_reunion_with_one_activity
    reunion = Reunion.new('Estes Park')
    hiking = Activity.new('Hiking')
    hiking.add_participant('Peter', 40)
    hiking.add_participant('Bob', 50)
    reunion.add_activity(hiking)
    assert_equal 90, reunion.absolute_cost
  end

  def test_it_can_find_absolute_cost_of_reunion_with_multiple_activities
    reunion = Reunion.new('Estes Park')
    hiking = Activity.new('Hiking')
    biking = Activity.new('Biking')
    hiking.add_participant('Peter', 40)
    hiking.add_participant('Bob', 20)
    biking.add_participant('Bob', 50)
    biking.add_participant('Peter', 10)
    reunion.add_activity(hiking)
    reunion.add_activity(biking)
    assert_equal 120, reunion.absolute_cost
  end

end
