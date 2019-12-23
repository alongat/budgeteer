module StringsHelper
  extend T::Sig

  # sig { params(name: String).returns(String) }
  def fix_string(string)
    detector = StringDirection::Detector.new
    detector.rtl?(string) ? string.reverse : string
  end
end