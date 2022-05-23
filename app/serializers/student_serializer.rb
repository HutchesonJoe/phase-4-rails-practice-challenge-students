class StudentSerializer < ActiveModel::Serializer
  attributes :name, :major, :age, :instructor
end
