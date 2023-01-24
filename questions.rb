class Questions 
  attr_accessor :first_num, :second_num, :answer
  def initialize
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @answer = @first_num + @second_num
  end

  def ask_question(name)
    puts "#{name}: What is the sum of #{first_num} and #{second_num}?"
    print "> "
    user_answer = gets.chomp
    if user_answer == @answer.to_s
      return true
    else
      return false
    end
  end


end

# question = Questions.new
# pp question.ask_question
