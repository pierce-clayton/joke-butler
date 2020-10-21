
require 'curses'
require 'pry'
require 'tty-box'
require 'tty-font'
require 'tty-prompt'

#top_menu = ["New User", "Member Access", "Quit"]
# "New User" sub menu: enter name > "Member Access"
# "Member Access" sub menu: enter name > "Tell me a new joke.", "Re-tell an old one.", "Nevermind" > "Top Menu"
# "Tell me a new joke." > iterates through local joke database and retrieves one user hasn't seen. If user has seen all these, acquire new joke from API.
# "Re-tell an old one." > iterates through local joke database of THIS user and chooses random.

def prompt 
    TTY::Prompt.new
end

def top_menu_arr
    ["New User", "Login", "Quit"]
end
#new_user = enter your name and it gets added to db
#login = verifies your name in db > member_access
def member_access_arr
    ["New Joke", "Old Jokes", "Clear Joke Library", "Delete Account"]
end

def new_user
    username = prompt.ask("What is your name?") 
    User.create({name: username})
    #new user gets added to db
end

def login
    user = prompt.ask("Please enter your name: ")
    user = User.find_by(name: user)
    user.nil? ? new_user : user
end

def member_access 
    prompt.select("Hello, how may I be of service?") do |menu|
        member_access_arr.each_with_index do |choice, index|
            menu.choice choice, index
        end
    end
end

def main_menu 
    prompt.select("Welcome, I am Joke Butler") do |menu|
    top_menu_arr.each_with_index do |choice, index|
        menu.choice choice, index
        end
    end
end


puts main_menu

puts member_access















































# THE BEGINNINGS OF A VERY BEGINNER CONSOLE BUT DUNNO WHAT I'M DOING. 

# OPTIONS = ["New User", "Member Access", "Nevermind"]

# Curses.init_screen

# Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_WHITE)
# Curses.color_pair(1)

# jb_tag = "Joke Butler, at your service"
# height, width = 24, 64
# top, left = (Curses.lines - height) /2, (Curses.cols - width) /2
# win1 = Curses::Window.new(height, width, top, left)
# win1.box("|", "-")
# win1.setpos(0, (width - jb_tag.length)/2)

# win1.addstr(jb_tag)
# win1.refresh

# win2 = win1.subwin(height - 6, width - 6, top + 4, left + 4)
# win2.setpos(2, 3)
# win2.attrset(Curses.color_pair(1) | Curses::A_NORMAL)
# win2.addstr("Please choose from the following options: ")
# win2 << "\n"
# win2 << "\n| New User"
# win2 << "\n| Member Access"
# win2 << "\n| Nevermind"
# win2.refresh
# win2.getch
# win2.clear
# win1.close

# ======================================================================================================
#SOURCE: https://dev.to/nwdunlap17/ruby-console-applications-for-beginners-making-menus-with-curses-4n6p
# class Menu

#     def Menu.start(choices, values)
#         menu = Menu.new(choices, values)
#         return menu.menu_loop
#     end

#     def initialize(choices, values)
#         @choices = choices
#         @values = values
#         @num_choices = choices.length
#         @index = 0
#     end

#     def menu_loop
#         while true
#             display
#             input = Curses.getch.to_s

#             if "SW".include?(input)
#                 input = input.downcase
#             end

#             case input
#             when "s"
#                 @index += 1
#                 if @index == @num_choices
#                     @index = 0
#                 end

#             when "w"
#                 @index -= 1
#                 if @index == -1
#                     @index = num_choices-1
#                 end

#             when " "
#                 return @values[@index]
#             end

#         end
#     end

#     def display
#         @num_choices.times do |i|
#             Curses.setpos((i), 0)
#             Curses.addstr("   ")
#             Curses.addstr("#{choices[i]}")
#         end

#         Curses.setpos(@index, 0)
#         Curses.addstr("->")

#         Curses.refresh
#     end

# end

# ================================================================================
#SOURCE: https://stac47.github.io/ruby/curses/tutorial/2014/01/21/ruby-and-curses-tutorial.html
# begin
#   # Building a static window
#   win1 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1, 0, 0)
#   win1.box("o", "o")
#   win1.setpos(2, 2)
#   win1.addstr("Hello")
#   win1.refresh

#   # In this window, there will be an animation
#   win2 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1, 
#                             Curses.lines / 2, Curses.cols / 2)
#   win2.box("|", "-")
#   win2.refresh
#   2.upto(win2.maxx - 3) do |i|
#     win2.setpos(win2.maxy / 2, i)
#     win2 << "*"
#     win2.refresh
#     sleep 0.05 
#   end

#   # Clearing windows each in turn
#   sleep 0.5 
#   win1.clear
#   win1.refresh
#   win1.close
#   sleep 0.5
#   win2.clear
#   win2.refresh
#   win2.close
#   sleep 0.5
# rescue => ex
#   Curses.close_screen
# end
# ====================================================================================================