# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Disable rails from automatically adding the "field_with_erros" div to fields when validation errors occur,
# because the fields are visually moved.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end