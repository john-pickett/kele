require "httparty"
require "json"
require "./lib/roadmap.rb"

class Kele
  attr_reader :email, :password
  include HTTParty
  include Roadmap

  def initialize(email, password)
    response = self.class.post(set_uri("sessions"), body: { email: email, password: password })
    if response.code == 401
      puts "Invalid email or password. Try again."
    else
      @auth_token = response['auth_token']
    end
  end

  def get_me
    response = self.class.get(set_uri("users/me"), bloc_auth)
    @my_data = JSON.parse(response.body)
  end

  def get_mentor_availability(id)
    response = self.class.get(set_uri("mentors/#{id}/student_availability"), bloc_auth)
    @mentor_data = JSON.parse(response.body)
  end


  private

  def set_uri(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  def bloc_auth
    { headers: {
      authorization: @auth_token
      }}
  end

end
