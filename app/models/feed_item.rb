class FeedItem < ActiveRecord::Base
  attr_accessible :message, :source, :title
  after_create :update_clients
  
  def update_clients
    Pusher['feed-updates'].trigger('new-item', self.to_json)
  end

end
