module Cart

  extend LapisLazuli
  class << self

    # This is a list of elements relevant for this helper.
    # The following is short notation, *only* use this if the element selector can be done in 1 line.
    # @formatter:off
    def proceed_to_checkout_link; browser.a(:text => /Proceed to checkout/); end
    def procees_address_button; browser.button(:name => "processAddress"); end
    def procees_carrier_button; browser.button(:name => "processCarrier"); end
    def agree_terms_checkbox; browser.checkbox(:id => "cgv"); end

  end
end