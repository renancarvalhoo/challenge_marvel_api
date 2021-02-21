module Immutable
  def new(*)
    # Create a new object, then freeze it along with its instance variables.
    object = super
    object.instance_variables.each do |var|
      object.instance_variable_get(var).freeze
    end
    object.freeze
  end
end