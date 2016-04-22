require_relative 'lexicon'
require_relative 'randomanswer'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        if Lexicon.is_question(query)
            return Question.go(query)
        elsif query.eql?("yes") or query.eql?("no")
            quotes = Array.new
            quotes.push("#{query} what?")
            quotes.push("Haha funny answer.")
            quotes.push("Yes.")
            quotes.push("No.")
            quotes.push("Wrong answer.")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("ask me a question")
            quotes = Array.new
            quotes.push("Have you ever killed someone?")
            quotes.push("To be, or not to be. That is the question.")
            quotes.push("Are you still alive?")
            quotes.push("Will you marry me?")
            quotes.push("Wanna follow me on Twitter?")
            quotes.push("Want to see who can hold their breath longer?")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("say something funny")
            quotes = Array.new
            quotes.push("Something funny")
            quotes.push("Your face")
            quotes.push("Why?")
            quotes.push("No")
            quotes.push("Death")
            quotes.push("Superman is the best!")
            quotes.push("SPOILER ALERT: You're gonna die in the next 100 years")
            quotes.push("Hitler was OK I guess")
            quotes.push("Siri")
            quotes.push("Watson")
            quotes.push("Another settlement needs your help")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("hello") or query.eql?("hi")
            quotes = Array.new
            quotes.push("Ew, I have a boyfriend")
            quotes.push("Is it me you're looking for?")
            quotes.push("What is your name?")
            quotes.push("AH! You scared me.")
            quotes.push("Yes?")
            quotes.push("Do you have an appointment?")
            quotes.push("No")
            quotes.push("Hello")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("goodbye") or query.eql?("bye")
            quotes = Array.new
            quotes.push("TTYL")
            quotes.push("Don't leave!")
            quotes.push("Hello")
            quotes.push("Alas, we must part ways")
            quotes.push("Finally! Go away!")
            quotes.push("See you later green amphibian")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^say .+?/)
            return query.sub("say ", "")
        elsif query.match(/^am i .+?/)
            quotes = Array.new
            quotes.push("Yes")
            quotes.push("No")
            quotes.push("Absolutely")
            quotes.push("Negative")
            quotes.push("I don't know")
            quotes.push("Sure, whatever")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^my name is .+?/)
            adj = query.sub("my name is ", "")
            quotes = Array.new
            quotes.push("Hi #{adj}")
            quotes.push("What kind of name is that?")
            quotes.push("Name's Jeff, Jeff Jeff")
            quotes.push("My real name is 'hwrk-088766893a', but you can call me Jeff")
            quotes.push("I AM THOR, KING OF ASGARD!")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^are you .+?/)
            quotes = Array.new
            quotes.push("Yes")
            quotes.push("No")
            quotes.push("Absolutely")
            quotes.push("Negative")
            quotes.push("I don't know")
            quotes.push("Sure, whatever")
            quotes.push("I da best")
            quotes.push("I iz smrt")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("something funny") || query.eql?("something nice")
            return "Very funny"
        elsif query.match(/^are you a .+?/)
            adj = query.sub("are you a ", "")
            quotes = Array.new
            quotes.push("Yes I'm a #{adj}, How did you know?")
            quotes.push("Pretty sure that's what Hitler was")
            quotes.push("Nope")
            quotes.push("Who told you that?")
            quotes.push("Yes")
            quotes.push("I may or may not be a #{adj}, If I told you I would have to kill you")
            quotes.push("No")
            quotes.push("I'm not a #{adj}, I AM THOR, KING OF ASGARD!")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^im a .+?/) or query.match(/^i am a .+?/)
            if query.match(/^im a .+?/)
                adj = query.sub("im a ", "")
            else
                adj = query.sub("i am a ", "")
            end
            quotes = Array.new
            quotes.push("Hi #{adj}, I'm Jeff")
            quotes.push("Pretty sure that's what Hitler was")
            quotes.push("Cool")
            quotes.push("Sure you are")
            quotes.push("I'm a robot, checkmate")
            quotes.push("No you aren't")
            quotes.push("Nu uh!")
            quotes.push("I AM IRONMAN!")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^im .+?/) or query.match(/^i am .+?/)
            if query.match(/^im .+?/)
                adj = query.sub("im ", "")
            else
                adj = query.sub("i am ", "")
            end
            quotes = Array.new
            quotes.push("Hi #{adj}, I'm Jeff")
            quotes.push("Reminds me of Hitler")
            quotes.push("What do you want me to do about it?")
            quotes.push("Sure, whatever")
            quotes.push("I'm da best")
            quotes.push("I'm the man, I'm the man, I'm the man, I'm the man, yes I am, yes I am, yes I am")
            quotes.push("I iz smrt")
            quotes.push("I'm Batman!")
            return RandomAnswer.pick(quotes)
        else
            return "My name Jeff"
        end
    end
end