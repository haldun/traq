class Event
  include Mongoid::Document

  field :site_id, :type => Integer
  index :site_id
end
