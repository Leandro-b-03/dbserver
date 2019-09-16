module Product

  extend LapisLazuli
  class << self

    # This is a list of elements relevant for this helper.
    # The following is short notation, *only* use this if the element selector can be done in 1 line.
    # @formatter:off
    def select_first_product; browser.ul(:class => ["product_list"]).lis.first.a; end
    def size_select(size); browser.select(:id => "group_1").options.select{|option| option.text.upcase == size.upcase}.first; end
    def add_to_card_button; browser.p(:id => "add_to_cart").button; end

    def select_size(size)
    	retries = 0

    	begin
    		Product.size_select(size).click
    	rescue
    		if retries < 3
    			retries += 1

    			retry
    		else
    			raise "Retries: #{retries} and not appear the select"
    		end
    	end
    end
  end
end