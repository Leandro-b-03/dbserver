module API
  require "httparty"

  extend LapisLazuli
  class << self
    include HTTParty

    # base_uri 'api.stackexchange.com'
    # key 'ebd3a73b7b68170cd6c43110f11f2c8e'
    # token '3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf'

    def create_card
      response = HTTParty.post("https://api.trello.com/1/cards?name=Teste&desc=A%20new%20card&pos=top&idList=5d7f7852b3c37b7e9fcc241b&keepFromSource=all&key=ebd3a73b7b68170cd6c43110f11f2c8e&token=3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf")

      puts response.code, response.body

      body = JSON.parse(response.body)
      body["id"]
    end

    def change_name(id, name)
      response = HTTParty.put("https://api.trello.com/1/cards/#{id}?name=#{name}&key=ebd3a73b7b68170cd6c43110f11f2c8e&token=3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf")

      puts response.code, response.body
    end

    def change_column(id, column)
      response_id_list = HTTParty.get("https://api.trello.com/1/boards/5d7f7852bbe09b4cbf123e40/lists?key=ebd3a73b7b68170cd6c43110f11f2c8e&token=3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf")

      body = JSON.parse(response_id_list.body)

      id_list = nil
      body.each { |list|
        if list["name"] == column
          id_list = list["id"]
        end
      }

      response = HTTParty.put("https://api.trello.com/1/cards/#{id}?idList=#{id_list}&key=ebd3a73b7b68170cd6c43110f11f2c8e&token=3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf")

      puts response.code, response.body
    end

    def delete_card(id)
      response = HTTParty.delete("https://api.trello.com/1/cards/#{id}?key=ebd3a73b7b68170cd6c43110f11f2c8e&token=3be9fb2c1cf1ba573ed61be017263cbfc7ac2ffddd329a5ca52e0ba535ab5caf")

      puts response.code, response.body
    end
  end
end