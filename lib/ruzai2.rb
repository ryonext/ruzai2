require "ruzai2/version"
require "active_support"
require "active_support/core_ext"
require "active_record"

module Ruzai2
  class RuzaiList < ActiveRecord::Base
    class << self
      def ban!(id_params, expired_at: nil)
        params = id_params.merge(
          expired_at: expired_at || Time.now + 7.days
        )
        RuzaiList.create(
          params
        )
      end

      def banned?(user_id, hoge_id, fuga_id)
        RuzaiList.where(
          user_id: user_id,
          hoge_id: hoge_id,
          fuga_id: fuga_id,
        ).where("expired_at < ?", Time.now).exist?
      end
    end
  end
end
