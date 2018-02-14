require_relative '../helpers/element-helper'
require_relative '../pages/../pages/freelancer-profile-page'

class UpworkHomePage
  PAGE_URL = 'http://upwork.com'
  ELEMENT_HELPER = ElementHelper.new

  def go_home
    $driver.get PAGE_URL
  end

  def freelancer_search(text)
    searchFreelanceIcon = ELEMENT_HELPER.getElementByCss($driver, '[data-qa="s_button"]')
    searchFreelanceIcon.click
    ELEMENT_HELPER.selectDropDownOption($driver, '[data-qa="search_field_dropdown"]', '[data-qa="freelancer_value"]')
    searchInput = ELEMENT_HELPER.getElementByCss($driver, '[data-qa="s_input"]')
    searchInput.send_keys(text)
    $driver.action.send_keys(searchInput, :enter).perform
  end

  def select_category()
    categoryDropDown = ELEMENT_HELPER.getElementByCss($driver, '[data-qa="categories-container"]')
    categoryDropDown.click
    ELEMENT_HELPER.selectDropDownOption($driver, '[data-log-sublocation="facets_category"]', '[data-qa="category:web-mobile-software-dev"]')
    subCategory = ELEMENT_HELPER.getElementByCss($driver, '[data-qa="sub-category:"]')
    $driver.action.send_keys(subCategory, :enter).perform
  end

  def select_hourly_rate()
    rateDropDown = ELEMENT_HELPER.getElementByCss($driver, '[data-log-sublocation="facets_rate"]')
    rateDropDown.click
    ELEMENT_HELPER.selectDropDownOption($driver, '[data-log-sublocation="facets_rate"]', '[data-facet-value="0-10"]')
    sleep 5
    # sleep need to be added to allow results appear
  end

  def get_freelancers_list()
    return ELEMENT_HELPER.getListOfEelemets($driver, "#oContractorResults", "section")
  end

  def open_freelancer_profile(index)
    item = get_freelancers_list()[index]
    item.find_element(:css, '[data-qa="tile_name"]').click
    return FreelancerProfilePage.new
  end

end