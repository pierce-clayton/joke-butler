require 'pry'
require 'tty-box'
require 'tty-font'
require 'tty-prompt'

require_relative '../config/environment'
require_relative '../bin/acquire_joke'

# Global Variable to keep user info
$user = ""

def prompt 
    TTY::Prompt.new
end

def top_menu_arr
    ["New User", "Login", "Quit"]
end

def member_access_arr
    ["New Joke", "Old Jokes", "Clear Joke Library", "Delete Account", "Quit"]
end

def new_user
    username = prompt.ask("You're new here, what is your name?") 
    $user = User.create({name: username})
    #new user gets added to db
end

def login
    user = prompt.ask("Please enter your name: ")
    $user = User.find_by(name: user)
    $user.nil? ? new_user : $user
end

def member_access 
    prompt.select("Welcome back, how may I be of service?") do |menu|
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

case main_menu
when 0 
    new_user
when 1
    login
when 2
    system('clear')
    return "Quit"
end

case member_access
when 0 #new joke
    $user.create_message(AcquireJoke.random_joke)
when 1#old jokes
    puts $user.jokes.shuffle[0].joke
when 2#clear joke library
    $user.jokes.destroy
when 3#delete account
    $user.destroy
when 4
    system('clear')
    return "Quit"
end

User.find_by(id: $user.id) ? member_access : "Goodbye"

binding.pry






 






















































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