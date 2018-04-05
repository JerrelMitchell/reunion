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

end
