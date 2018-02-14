require_relative '../spec/spec_helper'

context 'Search freelancer' do

  it 'by Ruby keyword' do
    #2. Type keyword “Ruby” in Find Freelancer search box
    $upworkHomePage.freelancer_search("Ruby")
    # check that page is loaded
    expect($elementHelper.getElementText($driver, '#oSearchContractorsHeader')).to eql('Ruby Developers & Programmers')
    # check that filter is not applied
    expect($elementHelper.getElementByCss($driver, '[data-o-log-click="facets_clear_all"]').attribute('class')).to include('disabled')
    #3. On Find Freelancer Search result page select additional filters:
    # 1. Category - Web, Mobile & Software
    $upworkHomePage.select_category()
    # check that filter is applied
    expect($elementHelper.getElementByCss($driver, '[data-o-log-click="facets_clear_all"]').attribute('class')).not_to include('disabled ')
    # 2. Hourly rate - $10 hours and below
    $upworkHomePage.select_hourly_rate()
    #4. Verify that first 3 freelancers has the keyword in their title
    3.times do |n|
      title = $upworkHomePage.get_freelancers_list()[n].find_element(:css, '[data-qa="tile_title"]').text
      # check job title contains Ruby
      expect(title).to include('Ruby')
      # check hourly rate is less then 10
      rate = $upworkHomePage.get_freelancers_list()[n].find_elements(:css, '.col-md-3 div')[0].attribute('data-rate').to_i
      expect(rate).to be <= 10
    end
    #5. Click on second freelancer to open profile
    @profilePage = $upworkHomePage.open_freelancer_profile(1)
    #6. Verify that the keyword is presented in title and in description
    # check job title contains Ruby
    expect(@profilePage.get_freelancer_title()).to include('Ruby')
    # check profile description contains Ruby
    expect(@profilePage.get_freelancer_overview()).to include('Ruby')
    #7. Verify that freelancer’s hourly rate match search criteria
    # check hourly rate is less then 10
    expect(@profilePage.get_freelancer_rate()).to be <= 10

  end

end
