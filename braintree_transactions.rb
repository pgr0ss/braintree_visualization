require 'braintree'

Braintree::Configuration.environment = :qa
Braintree::Configuration.merchant_id = "integration_merchant_id"
Braintree::Configuration.public_key = "integration_public_key"
Braintree::Configuration.private_key = "integration_private_key"

class BraintreeTransactions
  def initialize(window, all_x_values)
    @transaction_points = []
    Thread.new do
      while true
        transactions = Braintree::Transaction.search do |search|
          search.created_at >= Time.now - 60*10
        end

        @transaction_points = transactions.map { |t| TransactionPoint.new(window, t, all_x_values) }
        sleep 10
      end
    end
  end

  def all_transaction_points
    @transaction_points
  end
end
