if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_pxz8CQ8rRuGoTJmdS4TgC9Hm',
    :secret_key => 'sk_test_Mg0pDS108s2v5wkHWWuzHCSa'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]