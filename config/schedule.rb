set :output, {error: "log/cron-error.log", standard: "log/cron.log"}

every 30.minutes do
  rake "comic:check_new_chapter"
end
