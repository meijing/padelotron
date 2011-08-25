class Subscription < ActiveRecord::Base
  belongs_to :customer
  belongs_to :subscription_type
  scope :current, where(:active => true)

  after_create :activate_if_payment_ok

  def self.subscription_type_url(type)
    {
      :free => "https://tendel.chargify.com/h/48733/subscriptions/new"
    }[type]
  end

  def type
    subscription_type.name
  end

  def activate!
    update_attribute :active
  end

  private

  @@OK_SUBSCRIPTION_STATES= %w(trialing assessing active)
  @@ERROR_SUBSCRIPTION_STATES= %w(soft_failure past_due unpaid)
  @@FINISHED_SUBSCRIPTION_STATES= %w(canceled expired suspended)

  def activate_if_payment_ok
    require 'open-uri'
    logger.debug("Contacting Chargify for subscription##{self.id},#{self.external_signup_payment_id}")
    credentials = Padelotron::Application.config.chargify
    resp =open("https://tendel.chargify.com/subscriptions/#{self.external_signup_payment_id}.json",
      :http_basic_authentication => [ credentials[:username], credentials[:password]],
      "Content-Type" => "application/json")
    data =""
    resp.each_line{|l| data << l}
    data = JSON.parse(data)
    logger.debug "Chargify: got JSON: #{data.inspect}"
    subscription_state = data['subscription']['state']
    if (@@OK_SUBSCRIPTION_STATES.include?(subscription_state))
      self.active= self.payment_to_date = true
      self.last_payment= data['subscription']['activated_at']
      self.total_revenue= 100 * data['subscription']['balance_in_cents'].to_i
    else if (@@ERROR_SUBSCRIPTION_STATES.include?(subscription_state))
      self.active= self.payment_to_date = false
      end
    end
    save
  end


end