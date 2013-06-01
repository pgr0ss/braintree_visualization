require 'gosu'
require './braintree_transactions'
require './transaction_point'

class BraintreeVisualization < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Braintree Visualization"
    @all_x_values = {}
    @braintree_transactions = BraintreeTransactions.new(self, @all_x_values)
  end

  def update
    @transaction_points = @braintree_transactions.all_transaction_points
  end

  def draw
    @transaction_points.each(&:draw)
  end
end

window = BraintreeVisualization.new
window.show
