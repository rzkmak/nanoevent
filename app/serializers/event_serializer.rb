class EventSerializer < ActiveModel::Serializer
  type :event
  attributes :id, :name, :organizer, :capacity, :start_date, :end_date, :location, :tickets
end
