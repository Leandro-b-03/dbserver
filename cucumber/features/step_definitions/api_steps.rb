Given("I create a card in the Backlog Column") do
	@id = API.create_card
	puts "Id is #{@id}"
end

When("I change the card name to {string}") do |name|
  API.change_name(@id, name)
end

When("I move it to {string} column") do |column|
  API.change_column(@id, column)
end

Then("after all the proccess I delete the card") do
  API.delete_card(@id)
end