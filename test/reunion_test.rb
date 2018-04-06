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

  def test_it_can_give_a_list_of_unsettled_amounts_owed_to_or_by_a_participant
    reunion = Reunion.new('Estes Park')
    hiking = Activity.new('Hiking')
    biking = Activity.new('Biking')
    skiing = Activity.new('Skiing')

    hiking.add_participant('Peter', 90)
    hiking.add_participant('Bob', 20)
    hiking.add_participant('Sally', 65)

    biking.add_participant('Bob', 70)
    biking.add_participant('Sally', 30)
    biking.add_participant('Joe', 20)

    skiing.add_participant('Peter', 300)
    skiing.add_participant('Bob', 500)

    reunion.add_activity(hiking)
    reunion.add_activity(biking)
    reunion.add_activity(skiing)

    assert_equal [32, -100], reunion.list_unsettled_amounts('Peter')
    assert_equal [-38, 30, 100], reunion.list_unsettled_amounts('Bob')
    assert_equal [7, -10], reunion.list_unsettled_amounts('Sally')
    assert_equal [-20], reunion.list_unsettled_amounts('Joe')
  end

  def test_it_can_show_full_amount_owed_by_or_owed_to_a_participant
    reunion = Reunion.new('Estes Park')
    hiking = Activity.new('Hiking')
    biking = Activity.new('Biking')
    skiing = Activity.new('Skiing')
    hiking.add_participant('Peter', 90)
    hiking.add_participant('Bob', 20)
    hiking.add_participant('Sally', 65)

    biking.add_participant('Bob', 70)
    biking.add_participant('Sally', 30)
    biking.add_participant('Joe', 20)

    skiing.add_participant('Peter', 300)
    skiing.add_participant('Bob', 500)

    reunion.add_activity(hiking)
    reunion.add_activity(biking)
    reunion.add_activity(skiing)

    assert_equal (-68), reunion.absolute_unsettled_amount('Peter')
    assert_equal 92, reunion.absolute_unsettled_amount('Bob')
    assert_equal (-3), reunion.absolute_unsettled_amount('Sally')
    assert_equal (-20), reunion.absolute_unsettled_amount('Joe')
  end
end
