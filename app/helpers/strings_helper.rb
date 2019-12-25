module StringsHelper
  extend T::Sig

  # sig { params(name: String).returns(String) }
  def self.fix_string_direction(string)
    # Match hebrew letters ? reverse!
    return string if string.blank?
    string.match?(/[\u0590-\u05FF\uFB2A-\uFB4E]/) ? string.reverse : string
  end
end