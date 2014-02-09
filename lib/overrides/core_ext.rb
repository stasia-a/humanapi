class String
  def is_singular?
    self.pluralize != self and self.singularize == self
  end
end