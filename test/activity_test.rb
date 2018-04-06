require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('Hiking')
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new('Hiking')
    assert_equal 'Hiking', activity.name
  end

  def test_it_can_have_a_different_name
    activity = Activity.new('Snowshoeing')
    assert_equal 'Snowshoeing', activity.name
  end

  def test_it_starts_with_no_participants
    activity = Activity.new('Hiking')
    assert_equal ({}), activity.participants
  end

  def test_it_can_add_new_participants
    activity = Activity.new('Hiking')
    activity.add_participant('Bob', 10)
  end

  def test_it_can_show_amount_paid_for_activity
    activity = Activity.new('Hiking')
    activity.add_participant('Peter', 20)
    activity.add_participant('Bob', 10)
    assert_equal 30, activity.total_cost
  end

  def test_it_can_evaluate_unsettled_debt_for_participants
    activity = Activity.new('Hiking')
    activity.add_participant('Peter', 20)
    activity.add_participant('Bob', 10)
    assert_equal 5, activity.unsettled_amount('Peter')
    assert_equal (-5), activity.unsettled_amount('Bob')
  end

end
