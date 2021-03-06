# typed: strong

module SorbetRails::PluckToTStruct
  extend T::Sig
  sig {
    type_parameters(:U).
    params(
      ta_struct: ITypeAssert[T.type_parameter(:U)],
    ).
    returns(T::Array[T.type_parameter(:U)])
  }
  def pluck_to_tstruct(ta_struct, &blk); end
end

class ActiveRecord::Base
  extend SorbetRails::PluckToTStruct
end

class ActiveRecord::Relation
  Elem = type_member
  include SorbetRails::PluckToTStruct
end
