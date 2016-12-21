module Phrases

  def self.welcome_message
    `say -r 10 -v Ava "Welcome to Battleship!"`
  end

  def self.instructions
    `say -r 10 -v Ava "If you would like to start a new game..please type play
                      or the letter P........For game instructions type
                      instructions or the letter I........to give up and run
                      away like a scared little baby..type quit or the letter
                      Q......"`
  end

  def self.thinking
    sleep 1
    puts "Thinking".center(40, '-')
  end
end
