module Dumper::Customer
  class Psyschotype < ::Dumper::Base

    def details
      {
          id: id,
      }
    end
  end
end
