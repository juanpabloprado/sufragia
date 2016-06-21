class CampaignSerializer < ActiveModel::Serializer
  has_many :possible_options, serializer: OptionSerializer
  attributes :id, :name

  def possible_options
    object.options
  end
end
