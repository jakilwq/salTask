require 'active_support'
require 'active_support/core_ext'
require File.expand_path("../../test_helper", __FILE__)

class OrderTest < ActiveSupport::TestCase
  def order
    @order ||= Order.new
  end

  def test_valid_fixure
    assert orders(:one).valid?
    assert_equal 1, orders(:one).stripe_id
  end

  def test_order_instance
    assert_instance_of Order, order
  end

  
end
