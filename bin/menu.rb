require 'pry'
require 'tty-box'
require 'tty-font'
require 'tty-prompt'

require_relative '../config/environment'
require_relative '../bin/acquire_joke'


# Global Variable to keep user info
jb_box = TTY::Box.frame(
    width: 40, height: 5, 
    title: {top_left: "JOKE BUTLER"},
    border: {
        type: :thick,
        top_left: :corner_top_left,
        top_right: :corner_top_right,
        bottom_left: :corner_bottom_left,
        bottom_right: :corner_bottom_right
    }
) 
    
print jb_box


$user = ""

def prompt 
    TTY::Prompt.new
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

def member_access_arr
    ["New Joke", "Old Jokes", "Clear Joke Library", "Delete Account", "Quit"]
end

def member_access 
    prompt.select("Welcome back #{$user.name}, how may I be of service?") do |menu|
        member_access_arr.each_with_index do |choice, index|
            menu.choice choice, index
        end
    end
end

def main_menu_arr
    ["New User", "Login", "Quit"]
end

def main_menu 
    prompt.select("Greetings, I am Joke Butler") do |menu|
    main_menu_arr.each_with_index do |choice, index|
        menu.choice choice, index
        end
    end
end

def main_loop
    case main_menu
    when 0 
        new_user
        sleep (1)
        main_loop
    when 1
        login
        sleep(1)
        member_loop
    when 2
        system('clear')
        return "Quit"
    end
end


def member_loop
    case member_access
    when 0 #new joke
        system('clear')
        $user.create_message(AcquireJoke.random_joke)
        sleep(3)
        system('clear')
        member_loop
    when 1#old jokes
        system('clear')
        puts $user
        sleep(3)
        system('clear')
        member_loop
    when 2#clear joke library
        $user.jokes.destroy
        system('clear')
        puts "Clearing out your jokes"
        sleep(3)
        system('clear')
        member_loop
    when 3#delete account
        $user.destroy
        system('clear')
        puts "Removing your membership"
        sleep(3)
        system('clear')
        main_loop
    when 4
        system('clear')
        return "Quit"
    end
end

main_loop

#User.find_by(id: $user.id) ? member_access : "Goodbye"





