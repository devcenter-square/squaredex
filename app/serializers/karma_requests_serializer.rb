class KarmaRequestsSerializer < ActiveModel::Serializer
  attributes :id, :reason, :project_id, :from, :to, :approved
end