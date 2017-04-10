require "httparty"
require "json"

class Kele
  attr_reader :email, :password
  include HTTParty

  def initialize(email, password)
    response = self.class.post(set_uri("sessions"), body: { email: email, password: password })
    if response.code == 401
      puts "Invalid email or password. Try again."
    else
      @auth_token = response['auth_token']
    end
  end

  def get_me
    response = self.class.get(set_uri("users/me"), headers: { "authorization" => @auth_token })
    @my_data = JSON.parse(response.body)
  end

  private

  def set_uri(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

end
