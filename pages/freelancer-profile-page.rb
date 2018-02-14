require_relative '../helpers/element-helper'

class FreelancerProfilePage
  PAGE_URL = 'http://upwork.com'
  ELEMENT_HELPER = ElementHelper.new

  def get_freelancer_title()
    return ELEMENT_HELPER.getElementByCss($driver, '.fe-job-title').text
  end

  def get_freelancer_overview()
    return ELEMENT_HELPER.getElementByCss($driver, '.cfe-overview').text
  end

  def get_freelancer_rate()
    return ELEMENT_HELPER.getElementByCss($driver, 'cfe-profile-rate').text[1...-1].to_i
  end
end
