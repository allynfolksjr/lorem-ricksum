module RickStevesTvScripts
  def load_scripts
    @words = Hash.new(0)

    url = URI.parse("http://www.ricksteves.com/watch-read-listen/video/tv-show")

    puts "Beginning Download of TV Show Home Page"
    begin
      script_page = Nokogiri::HTML(Net::HTTP.get(url))
    rescue e
      puts "HTTP get for TV Show Failed. Bailing."
      puts "Error was: #{e}"
      abort
    end

    likely_links = script_page.xpath('//a').select{|link| link.attributes["href"].value =~ /\/watch-read-listen\/video\/tv-show\//}.map{|link| link.attributes["href"].value }

    puts "#{likely_links.size} possible links for TV shows found. Beginning parsing."

    likely_links.each_with_index do |likely_link,i|
      puts "(#{i+1}/#{likely_links.size}) Downloading #{likely_link}"
      url = URI.parse("http://www.ricksteves.com" + likely_link)
      show_page = Nokogiri::HTML(Net::HTTP.get(url))

      if show_page.xpath('//h2[text()="Script"]').present?
        puts "\tThis looks like a TV show with a script. Parsing."
        raw_script = show_page.xpath('//div[preceding:: h2[text()="Script"]]').first.content.gsub(/(\r|\n|\t|-|…|\.|—|,)/,' ').gsub(/\s+/, " ")
        puts "\tScript spanning approxmately #{raw_script.length} characters detected. Loading into hash."
        words = raw_script.split(" ")

        words.each{|word| @words[word] += 1}
      else
        puts "\t(!) This doesn't look like a TV show, or doesn't have a script. Skipping."
      end
    end

    File.open('rick_steves_words.yaml','w'){|f| f.write @words.to_yaml}
  end

  private

  def load_script
  end


end
