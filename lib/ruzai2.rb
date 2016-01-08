require "ruzai2/version"
require "active_support"
require "active_support/core_ext"
require "active_record"

module Ruzai2
  class RuzaiList < ActiveRecord::Base
    class << self
      def ban!(user_id, hoge_id, fuga_id, expired_at: nil)
        RuzaiList.create(
          user_id: user_id,
          hoge_id: hoge_id,
          fuga_id: fuga_id,
          expired_at: expired_at || Time.now + 7.days
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
