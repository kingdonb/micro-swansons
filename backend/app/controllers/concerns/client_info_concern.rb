module ClientInfoConcern
  def get_client_info
    @client_info = {}
    @client_info[:remote_ip] = request.remote_ip
  end
end
