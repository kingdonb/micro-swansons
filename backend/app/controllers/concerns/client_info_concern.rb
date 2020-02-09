module ClientInfoConcern
  extend ActiveSupport::Concern
  def get_client_info
    @client_info = {}
    @client_info[:remote_ip] = request.remote_ip

    self
  end

  def my_client_ip
    @client_info[:remote_ip]
  end
end
