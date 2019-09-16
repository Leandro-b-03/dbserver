module Category

  extend LapisLazuli
  class << self

    # This is a list of elements relevant for this helper.
    # The following is short notation, *only* use this if the element selector can be done in 1 line.
    # @formatter:off
    def select_category_link(category); browser.ul(:class => ["sf-menu"]).as.select{|a| a.text.downcase.include? category.downcase}.first; end
    def select_subcategory_link(category); browser.as.select{|a| a.text.downcase.include? category.downcase}.first; end

  end
end