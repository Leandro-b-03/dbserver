Given("I am on website {string}") do |url|
  @url = url
  Nav.to @url
end

When("I go to the sign in page") do
  Register.go_to_sign_in_page
end

When("I input an valid email and proceed to create an account") do
  Register.create_account
end

When("then I fill the form") do
  Register.fill_form
end

Then("I sign up") do
  Register.ensure_registered
end

Given("I am on the {string} Category") do |category|
  Nav.to @url
  Category.select_category_link(category).hover
end

Given("I go to {string}") do |category|
  Category.select_subcategory_link(category).click
end

When("I select the first product in the list") do
  Product.select_first_product.click
end

When("I add it to cart on the {string} size") do |size|
  Product.select_size(size)
  Product.add_to_card_button.click
end

When("I proceed to checkout") do
  Cart.proceed_to_checkout_link.click
  Cart.proceed_to_checkout_link.click
end

When("I select the address") do
  Cart.procees_address_button.click
end

When("I select the shipping") do
  Cart.agree_terms_checkbox.click
  Cart.procees_carrier_button.click
end

When("I select the payment type") do
  Checkout.bankwire_link.click
  Checkout.checkout_button.click
end

Then("I place the order") do
  Checkout.ensure_ordered
  puts "Reference: #{Checkout.reference_div.text.scan(/\breference\s(\w+)/).first.first.gsub('reference ', '')}"
end