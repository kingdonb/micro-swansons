module SeatSemaphore
  extend ActiveSupport::Concern
  include TableDecorator

  def decrement_seats!(client_ip:)
    if seats > 0
      with_lock do
        unless clients.include? client_ip
          self.seats = seats - 1
          self.clients << client_ip
          save!
        else
          raise Table::AlreadySeated
        end
      end
    else
      raise Table::NoSeatsLeft
    end

  rescue Table::NoSeatsLeft => e
    Rails.logger.warn("Table::NoSeatsLeft: #{client_ip} refused at #{table_deco}.")
    raise e

  rescue Table::AlreadySeated => e
    Rails.logger.info("Table::AlreadySeated: The Ron at #{client_ip} is "\
                      "already seated, but tried to sit at #{table_deco}. "\
                      "(Handled by Waiter: Showed him to his same seat again.)")
    true
  end
end
