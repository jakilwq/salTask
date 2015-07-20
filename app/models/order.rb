class Order < ActiveRecord::Base

  attr_accessor :cc
  attr_accessor :cvc
  attr_accessor :exp_month
  attr_accessor :exp_year
  attr_accessor :stripe_card_token
  attr_accessor :stripeToken

  validates :email, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true

  after_save :pusher

  def save_with_payment
    if valid?

      customer = Stripe::Customer.create(description: email, plan: '1', source: stripeToken)
      self.stripe_id = customer.id
      self.save!
    end
  rescue Stripe::InvalidRequestError => e
    puts("Stripe error while creating customer: #{e.message}")
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end


  def pusher
    Pusher['main'].trigger('new_message', {:city => city})
    Pusher['main'].trigger('total', {:total =>Order.count(:all)})
  end

end
