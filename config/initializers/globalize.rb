# Define globalize accessors for each translates
# https://github.com/globalize/globalize-accessors#always-define-accessors

module TranslatesWithAccessors
  def translates(*params)
    options = params.extract_options!
    options.reverse_merge!(:globalize_accessors => true)
    accessors = options.delete(:globalize_accessors)
    super
    globalize_accessors if accessors
  end
end

ActiveRecord::Base.send(:extend, TranslatesWithAccessors)
