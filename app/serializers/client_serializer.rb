class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_amount

  def total_amount
    self.object.memberships.sum{|mem| mem.charge}
  end

end
