require 'curses'
require 'pry'


#top_menu = ["New User", "Member Access", "Quit"]
# "New User" sub menu: enter name > "Member Access"
# "Member Access" sub menu: enter name > "Tell me a new joke.", "Re-tell an old one.", "Nevermind" > "Top Menu"
# "Tell me a new joke." > iterates through local joke database and retrieves one user hasn't seen. If user has seen all these, acquire new joke from API.
# "Re-tell an old one." > iterates through local joke database of THIS user and chooses random.

Curses.init_screen
Curses.start_color
Curses.noecho
top_menu = ["New User", "Member Access", "Nevermind"]

def draw_menu(top_menu, active_index = nil)
    top_menu.each do |element, index|
        top_menu.setpos(index + 1, 1)
        top_menu.attrset(index == active_index ? Curses::A_REVERSE : Curses::A_NORMAL)
        top_menu.addstr("#{element}")
    end
end

Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_WHITE)
Curses.color_pair(1)
text1 = "Welcome. "
x = (Curses.cols - text1.length) /2  
y = Curses.lines/2
Curses.setpos(y, 0)
Curses.addstr(text1)
Curses.addstr("How may I assist you?")
Curses.refresh


Curses.setpos(1, 0)
Curses.addstr("")

key = Curses.getch

Curses.setpos(0, 0)
Curses.addstr("You pressed #{key}!")

Curses.refresh
Curses.getch
















































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