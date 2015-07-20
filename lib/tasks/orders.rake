namespace :orders do
  desc "TODO"

  task :bulk_add, [:amount] => :environment do |task, args|
    unless args.amount.to_i > 0
      puts "Please pass in an non-zero integer like this 'rake orders:bulk_add[100]'"
      return 
    end

    (1..args.amount.to_i).each do |item|
      rand_hex = SecureRandom.hex
      @order = Order.new(
        email: "#{rand_hex[0..5]}@#{rand_hex[0..5]}.#{rand_hex[0..2]}",
        address: rand_hex,
        city: rand_hex[0..5],
        state: rand_hex[0..1],
        zip: rand_hex[0..4],
        stripe_id: rand_hex
        )
      @order.save
    end
  end
end