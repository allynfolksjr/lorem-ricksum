class Ipsum
  module Controller
    @previous_word = ""
    def ipsum_word
      selected_word = ipsum_words.sample
      if selected_word == @previous_word
        ipsum_word
      else
        @previous_word = selected_word
        selected_word
      end
    end

    def ipsum_sentence
      sentence_array = []
      (5..12).to_a.sample.times do
        sentence_array << ipsum_word
      end

      sentence = sentence_array.join(" ")
      sentence += "."
      sentence
    end

    def ipsum_paragraph
      paragraph_array = []
      (5..8).to_a.sample.times do
        paragraph_array << ipsum_sentence
      end

      paragraph_array.join(" ")

    end

    private
    def ipsum_words
      if @ipsum_words
        @ipsum_words
      else
        @ipsum_words = YAML.load_file(Rails.root + "compiled_words.yml")
      end
    end

  end
end
