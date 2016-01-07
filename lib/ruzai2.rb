require "ruzai2/version"

module Ruzai2
  class RuzaiList
    class << self
      def ban!(user_id, hoge_id, fuga_id, expired_at: nil)
        RuzaiList.create(
          user_id: user_id,
          hoge_id: hoge_id,
          fuga_id: fuga_id,
          expired_at: expired_at || Time.zone.now + 7.days
        )
      end

      def banned?(user_id, hoge_id, fuga_id)
        RuzaiList.where(
          user_id: user_id,
          hoge_id: hoge_id,
          fuga_id: fuga_id,
        ).where("expired_at < ?", Time.zone.now).exist?
      end
    end
  end
end
