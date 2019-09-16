module Checkout

  extend LapisLazuli
  class << self

    # This is a list of elements relevant for this helper.
    # The following is short notation, *only* use this if the element selector can be done in 1 line.
    # @formatter:off
    def bankwire_link; browser.a(:class => "bankwire"); end
    def checkout_button; browser.button(:class => ["button", "btn", "btn-default", "button-medium"]); end
    def checkout_confirm; browser.p(:class => "cheque-indent"); end
    def reference_div; browser.div(:class => "box"); end

    def ensure_ordered
      if (!Checkout.checkout_confirm.present?)
        raise "The custumer was not created"
      end
    end

  end
end