class ChargeOrderJob < ApplicationJob
  queue_as :default

  def performorder(pay_type_params)
    # Do something later
    order.charge!(pay_type_params)
  end
end
