class ElementHelper

  def getElementByCss (driver, css)
    if driver.find_element(:css, 'h1').text == 'Access to this web page is denied.'
      puts 'Access to this web page is denied.'
      return nil
    else
      wait = Selenium::WebDriver::Wait.new(:timeout => 1000)
      element = wait.until {driver.find_element(:css, css)}
      return element
    end
  end

  def getElementText (driver, css)
    return getElementByCss(driver, css).text
  end

  def selectDropDownOption (driver, parentCss, optionCss)
    dropdown_list = getElementByCss(driver, parentCss)
    option = dropdown_list.find_element(css: optionCss)
    option.click
  end

  def getListOfEelemets (driver, parentCss, optionCss)
    dropdown_list = getElementByCss(driver, parentCss)
    options = dropdown_list.find_elements(css: optionCss)
    return options
  end

end