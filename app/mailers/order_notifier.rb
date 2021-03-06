class OrderNotifier < ActionMailer::Base
  layout 'order_notifier'
  default from: "ecommetester@mail.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    
    mail to: order.email, subject: 'Подтверждение заказа в Ecomme'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @order = order

    mail to: order.email, subject: 'Заказ из Ecomme отправлен'
  end
end
