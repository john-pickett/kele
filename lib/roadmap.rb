module Roadmap

  def get_roadmap(id)
    response = self.class.get(set_uri("roadmaps/#{id}"), bloc_auth)
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(id)
    response = self.class.get(set_uri("checkpoints/#{id}"), bloc_auth)
    @checkpoint = JSON.parse(response.body)
  end
  
end
