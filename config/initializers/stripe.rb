Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xoYZU4aHGMPY9k2TXQB3LH6t',
  :secret_key      => 'sk_test_BdqBaaVeWAZDr4fYXLWMQ6hW'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]