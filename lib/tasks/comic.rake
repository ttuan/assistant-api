namespace :comic do
  task check_new_chapter: :environment do
    Comic::CheckNewChapterService.new.perform
  end
end
