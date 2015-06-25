# ThinkingSphinx::Index.define :restaurant, :with => :active_record do
#   # fields
#   indexes :name, :description
#   indexes dishs(:name)
#
#   # attributes
#
#   has created_at, updated_at
# end