class KarmaRequestsSerializer < ActiveModel::Serializer
  attributes :reason, :project_id, :from, :to, :approved
end