module Register
  require "faker"
  require "active_support"
  require "active_support/core_ext"

  extend LapisLazuli
  class << self

    # This is a list of elements relevant for this helper.
    # The following is short notation, *only* use this if the element selector can be done in 1 line.
    # @formatter:off
    def sign_up_link; browser.a(:text => /Sign in/); end
    def email_input; browser.input(:id => "email_create"); end
    def create_button; browser.button(:id => "SubmitCreate"); end

    def title_radio; browser.input(:id => "id_gender1"); end
    def first_name_input; browser.input(:id => "customer_firstname"); end
    def last_name_input; browser.input(:id => "customer_lastname"); end
    def password_input; browser.input(:id => "passwd"); end
    def birth_day_dropdown(day); browser.select(:id => "days").options.select{|option| option.text.include? day}.first; end
    def birth_month_dropdown; browser.select(:id => "months").options.select{|option| !option.text.include? '-'}; end
    def birth_year_dropdown; browser.select(:id => "years").options.select{|option| !option.text.include? '-'}; end
    def get_birth_month_dropdown; browser.select(:id => "months").text; end

    def first_name_address_input; browser.input(:id => "firstname"); end
    def last_name_address_input; browser.input(:id => "lastname"); end
    def company_input; browser.input(:id => "company"); end
    def address1_input; browser.input(:id => "address1"); end
    def address2_input; browser.input(:id => "address2"); end
    def city_input; browser.input(:id => "city"); end
    def state_input; browser.select(:id => "id_state").options.select{|option| !option.text.include? '-'}; end
    def postcode_input; browser.input(:id => "postcode"); end
    def phone_input; browser.input(:id => "phone"); end
    def phone_mobile_input; browser.input(:id => "phone_mobile"); end
    def alias_input; browser.input(:id => "alias"); end
    def register_button; browser.button(:id => "submitAccount"); end

    def sign_out_link; browser.a(:text => /Sign out/); end

    def go_to_sign_in_page
      Register.sign_up_link.click
    end

    def create_account
      email = "teste.#{Time.now.strftime("%d-%m-%Y.%H-%M_%S")}@mailinator.com"
      Register.email_input.to_subtype.set(email)
      puts "The email is #{email}"
      Register.create_button.click
    end

    def fill_form
      Register.title_radio.click
      
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name

      Register.first_name_input.to_subtype.set(first_name)
      Register.last_name_input.to_subtype.set(last_name)
      Register.password_input.to_subtype.set("123456")
      Register.birth_month_dropdown.sample.click
      Register.birth_day_dropdown(day_in_month(Register.get_birth_month_dropdown)).click
      Register.birth_year_dropdown.sample.click
      Register.first_name_address_input.to_subtype.set(first_name)
      Register.last_name_address_input.to_subtype.set(last_name)
      Register.company_input.to_subtype.set(Faker::Company.name)
      Register.address1_input.to_subtype.set(Faker::Address.street_address)
      Register.address2_input.to_subtype.set(Faker::Address.secondary_address)
      Register.city_input.to_subtype.set(Faker::Address.city_suffix)
      Register.state_input.sample.click
      Register.postcode_input.to_subtype.set(Faker::Address.zip_code[0..4])
      Register.city_input.to_subtype.set(Faker::Address.city_suffix)
      Register.phone_input.to_subtype.set(Faker::PhoneNumber.cell_phone)
      Register.phone_mobile_input.to_subtype.set(Faker::PhoneNumber.cell_phone)
      Register.alias_input.to_subtype.set("Home")

      Register.register_button.click
    end

    def ensure_registered
      if (!Register.sign_out_link.present?)
        raise "The custumer was not created"
      end
    end

    def day_in_month(month)
      # puts "The month selected was #{month}"
      month = Date.parse("1st #{month} 2019")

      day = rand(1...Date.parse(month.end_of_month.to_s).day.to_i)

      day.to_s
    end

  end
end