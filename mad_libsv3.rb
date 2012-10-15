class MadLib

  def initialize
    @string = ""
    @to_be_subbed = []
    @subbed = {}
  end
  
  def play
      show_prelude
      get_string_input
      extract_words_to_be_substituted
      show_interlude
      get_substitution_input
      substitute_words
      show_postlude
  end
  
  private

    def show_prelude
      puts "Please enter a paragraph, with words you want to substitute written like this: \"((part of speech))\".  Or just press Enter for a sample Mad Lib:"
    end

    def get_string_input
      entry = gets.chomp
      if entry.empty?
        @string = "I had a ((an adjective)) sandwich for lunch today.  It dripped all over my ((a body part)) and ((a noun))."
      else
        @string = entry
      end
    end
    
    def extract_words_to_be_substituted
      str_dup = @string.dup
      while str_dup.include?('))')
        a, b, str_dup = str_dup.partition(/\(\(.*?\)\)/)
        @to_be_subbed << b.delete('(())') 
      end
    end
    
    def show_interlude
      puts "OK, let's do this thing!"
      puts
    end

    def get_substitution_input
      @to_be_subbed.each do |word|
        puts "Give me #{word}:"
        @subbed[word] = gets.chomp
      end
    end
    
    def substitute_words
      while @string.include?('))')
        a, b, c = @string.partition(/\(\(.*?\)\)/)
        b.delete!('(())') 
        @string = a + @subbed[b] + c 
      end
    end

    def show_postlude
      puts "Here's the final paragraph.  Laugh it up you silly goose!"
      puts @string
    end
end

MadLib.new.play
