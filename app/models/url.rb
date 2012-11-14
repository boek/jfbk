class Url < ActiveRecord::Base
  attr_accessible :long_url, :hash_url



  def self.longify hash
    url = Url.where(:hash_url => hash).first
    url.count = url.count.next
    url.save

    url.long_url
  end

  def self.shortify url
    url = Url.new(:long_url => url)
    url.save
    url.hash_url = url.id.to_s(36)
    url.save

    url.hash_url
  end
end
