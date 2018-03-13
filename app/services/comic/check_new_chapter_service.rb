class Comic::CheckNewChapterService
  attr_reader :agent

  def initialize
    @agent = Mechanize.new
  end

  def perform
    Comic.all.each do |comic|
      page = agent.get comic.url
      updated_date = DateTime.parse page.search(".date.updated").text
      if updated_date > comic.updated_at
        lastest_chapter = page.search(".chapter-list .row span a")[0]
        comic.users.each do |user|
          body = <<~HEREDOC
            Đã có #{lastest_chapter.text} rồi anh êy: #{lastest_chapter.attr("href")}
          HEREDOC
          Chatwork::Speaker.new(user, body).speak
        end
      end
      comic.update_attributes updated_at: updated_date
    end
  end
end
