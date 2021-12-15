class Decorator
  @@protocol = ENV['APP_PROTOCOL'] || 'https'
  @@host     = ENV['APP_HOST']     || 'localhost'
  @@defaults = {
    company_name: 'unaffiliated'
  }
  
  def initialize(user)
    if user.is_a? User
      @data = calculate user
    else
      @data = user
    end
  end

  def populate
    @@defaults.merge @data
  end

  def calculate(user)
    {
      name:              user.first_name,
      parsed_first_name: user.parsed_first_name,
      segment_created:   user.segments.exists?,
      campaign_created:  user.campaigns.exists?,
      design_created:    user.designs.exists?,
      company_name:      user.company_name,
      sign_up_source:    user.sign_up_source,
      email_domain:      "https://#{user.email.split('@').last}",
      store_connected:   user.store_connected,
      admin_link:        "#{@@protocol}://#{@@host}/admin/users/#{user.id}"
    }.compact
  end
end
