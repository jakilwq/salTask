require 'active_support'
require 'active_support/core_ext'
require File.expand_path("../../test_helper", __FILE__)

class OrderTest < ActiveSupport::TestCase
  def order
    @order ||= Order.new
  end

  def test_valid
    assert order.valid?
  end
end
