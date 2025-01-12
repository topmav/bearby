require 'sitemap_generator'

# Disable gzip compression
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.default_host = "https://bearby.app"

SitemapGenerator::Sitemap.create do

  # Add static pages
  add terms_of_use_path, changefreq: 'yearly'
  add privacy_policy_path, changefreq: 'yearly'
  #add about_us_path, changefreq: 'yearly'
  #add become_a_partner_path, changefreq: 'monthly'
  add do_not_sell_path, changefreq: 'yearly'

end