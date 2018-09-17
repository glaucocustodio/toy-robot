Ohm.redis = Redic.new(ENV.fetch("REDIS_URL") { "redis://127.0.0.1:6379" })
