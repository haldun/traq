class Event
  include Mongoid::Document

  field :name, type: String
  field :properties, type: Hash
  field :site_id, type: Integer
  field :created_at, type: DateTime

  index :site_id

  def self.create_from_request! request
    token = request.params['token'] and
    name = request.params['name'] and
    site = Site.fetch_from_token(token).tap { |site| return if site.nil? }
    event = {
      site_id: site.id,
      name: name,
      created_at: Time.now.utc
    }
    event_id = collection.insert(event)
    return !event_id.nil?
  end
end
