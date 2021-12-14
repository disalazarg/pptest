protocol = ENV['APP_PROTOCOL'] || "https"
host     = ENV['APP_HOST']     || 'localhost'

IntercomRails.config do |config|
  config.user.custom_data = {
    name: :first_name,
    parsed_first_name: :parsed_first_name,
    segment_created: Proc.new { |user| user.segments.exists? },
    campaign_created: Proc.new { |user| user.campaigns.exists? },
    design_created: Proc.new { |user| user.designs.exists? },
    company_name: :company_name,
    sign_up_source: :sign_up_source,
    email_domain: Proc.new { |user| "https://#{user.email.split('@').last}"},
    store_connected: :store_connected,
    admin_link: Proc.new { |user| "#{protocol}://#{host}/admin/users/#{user.id}" }
  }
end
