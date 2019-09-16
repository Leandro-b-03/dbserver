require 'json'
require 'lapis_lazuli'
require 'lapis_lazuli/cucumber'
require 'allure-cucumber'
require 'allure-cucumber/dsl'

include AllureCucumber::DSL

Before do |scenario|
  # Set a variable wiht the feature and scenario name
  @feature_name = scenario.feature.name
  @scenario_name = scenario.name
  
  @step = 0

  # Set an error variable array
  $tagerros ||= []
  scenario_tags = scenario.source_tag_names

  # Set a variable with scenario tags
  @feature_tag = scenario_tags.first

  # Set screenshots path
  url = 'teste'
  @screenshots_path = "report/screenshots/#{Time.now.strftime("%d-%m-%Y.%H-%M_%S")}"
  FileUtils.mkpath @screenshots_path
end

After do |scenario|
  # Clean browser session
  browser.cookies.clear rescue warn 'Without session to clean'

  if scenario.failed?
    if (@fullscreen == "true")
      browser.driver.manage.window.maximize
    end
    
    name = "0 - Error - #{scenario.name}"
    encoded_img = "#{@screenshots_path}/#{name}.png"
    width  = browser.execute_script("return Math.max(document.body.scrollWidth,document.body.offsetWidth,document.documentElement.clientWidth,document.documentElement.scrollWidth,document.documentElement.offsetWidth);")
    height = browser.execute_script("return Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);")
    browser.driver.manage.window.resize_to(width+200, height+200)
    browser.screenshot.save(encoded_img)
    embed(File.open(encoded_img), 'image/png', name)
    browser.driver.manage.window.maximize
  end
end

AfterStep do |result, step|
  if (@api)
    @step ||= 1
    # puts step.name
    unquote = step.name
   
    if (unquote.include? "\"")
      unquote = step.name.gsub!(/\"/, '').gsub('http://', '').gsub('/', '')
    end

    name = "#{Time.now.strftime("%d%m%Y%H%M")}-Passo #{@step} - #{unquote}"
    encoded_img = "#{@screenshots_path}/#{name}.png"
    begin 
      browser.screenshot.save(encoded_img)
    rescue
      browser.refresh

      browser.screenshot.save(encoded_img)
      name = "#{Time.now.strftime("%d%m%Y%H%M")}-Passo #{@step} - #{unquote}"
      encoded_img = "#{@screenshots_path}/#{name}.png"
    end
    embed(File.open(encoded_img), 'image/png', name)
    @step += 1

    # Wait the required time
    sleep @step_pause_time rescue sleep 0
  end
end

Before('@api') do
  @api = true
end