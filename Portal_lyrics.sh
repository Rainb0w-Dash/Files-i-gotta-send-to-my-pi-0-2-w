#!/bin/bash

# Portal Ending Credits Player - Plays Portal Ending Credits in Linux Terminal.
#
# Copyright (C) 2025 Eniti-Codes
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


# --- Configuration ---
# Set the path to the game's sound files. Verify these paths for your system.
PORTAL1_SONG_PATH="/home/rainbow-dash/Music/portal_still_alive.mp3"
PORTAL2_SONG_PATH="/home/rainbow-dash/Music/portal2_want_you_gone.wav"

TYPING_SPEED="0.1"

# --- Functions ---

type_line() {
    # Check if a string was passed as an argument.
    if [[ -z "$1" ]]; then
        echo
        return
    fi
    local line="$1"
    
    # Calculate the delay based on the TYPING_RATE.
    # A higher rate results in a smaller delay.
    local delay=$(awk "BEGIN {print 1/$TYPING_RATE}")

    # Loop through each character in the string.
    for (( i=0; i<${#line}; i++ )); do
        echo -n "${line:$i:1}"
        sleep $delay
    done
    echo
}


Typing_RATE() {
    if [[ -z "$1" ]]; then
        echo "Error: Please provide a Typing_RATE value."
        return 1
    fi
    
    # Update the global TYPING_RATE variable.
    TYPING_RATE="$1"
}

# Function to simulate the Portal 1 ending credits.
play_still_alive() {
    if [[ ! -f "$PORTAL1_SONG_PATH" ]]; then
        echo "Error: Portal 1 audio file not found at '$PORTAL1_SONG_PATH'."
        echo "Please check the path and try again."
        exit 1
    fi

    clear
    tput setaf 3

    echo "==================================="
    echo "            Still Alive            "
    echo "==================================="
    echo

    # Play the song in the background.
    ffplay -nodisp -autoexit "$PORTAL1_SONG_PATH" > /dev/null 2>&1 &
    local song_pid=$!


    # --- Still Alive Lyrics ---
    Typing_RATE "9"
    type_line "This was a triumph"
    sleep 1
    type_line "I'm making a note here, 'Huge success'"
    sleep 1
    type_line "It's hard to overstate my satisfaction"
    type_line
    sleep 3
    type_line "Aperture Science"
    sleep 2
    type_line "We do what we must because we can"
    sleep 2
    Typing_RATE "12"
    type_line "For the good of all of us, except the ones who are dead"
    type_line
    sleep 1
    Typing_RATE "18"
    type_line "But there's no sense crying over every mistake"
    sleep 1
    type_line "You just keep on trying 'til you run out of cake'"
    sleep 1
    type_line "And the science gets done and you make a neat gun"
    sleep 1
    type_line "For the people who are still alive"
    Typing_RATE "9"
    type_line
    sleep 8
    type_line "I'm not even angry"
    sleep 2
    type_line "I'm being so sincere right now"
    sleep 2
    type_line "Even though you broke my heart and killed me"
    sleep 2
    Typing_RATE "14"
    type_line "And tore me to pieces"
    sleep 2
    type_line "And threw every piece into a fire"
    sleep 2
    type_line "As they burned, it hurt because I was so happy for you"
    type_line
    sleep 2
    Typing_RATE "18"
    type_line "Now these points of data make a beautiful line"
    sleep 1
    type_line "And we're out of beta, we're releasing on time"
    sleep 1
    type_line "So I'm glad I got burned, think of all the things we learned"
    sleep 1
    type_line "For the people who are still alive"
    Typing_RATE "9"
    type_line
    sleep 8
    type_line "Go ahead and leave me"
    sleep 2
    type_line "I think I prefer to stay inside"
    sleep 1
    type_line "Maybe you'll find someone else to help you"
    sleep 2
    type_line "Maybe Black Mesa"
    sleep 2
    type_line "That was a joke; ha-ha, fat chance"
    sleep 2
    Typing_RATE "12"
    type_line "Anyway, this cake is great, it's so delicious and moist"
    type_line
    Typing_RATE "18"
    type_line "Look at me, still talking when there's science to do"
    sleep 1
    type_line "When I look out there, it makes me glad I'm not you"
    sleep 1
    type_line "I've experiments to run, there is research to be done"
    sleep 2
    type_line "On the people who are still alive"
    type_line
    sleep 2
    type_line "And believe me, I am still alive"
    sleep 2
    type_line "I'm doing science and I'm still alive"
    sleep 2
    type_line "I feel fantastic and I'm still alive"
    sleep 2
    type_line "While you're dying, I'll be still alive"
    sleep 2
    type_line "And when you're dead, I will be still alive"
    sleep 2
    type_line "Still alive, still alive"
    Typing_RATE "9"
    type_line
    
    tput sgr0
    wait $song_pid
}

# Function to simulate the Portal 2 ending credits.
play_want_you_gone() {
    if [[ ! -f "$PORTAL2_SONG_PATH" ]]; then
        echo "Error: Portal 2 audio file not found at '$PORTAL2_SONG_PATH'."
        echo "Please check the path and try again."
        exit 1
    fi

    clear
    tput setaf 3

    echo "==================================="
    echo "          Want You Gone            "
    echo "==================================="
    echo

    # Play the song in the background.
    ffplay -nodisp -autoexit "$PORTAL2_SONG_PATH" > /dev/null 2>&1 &
    local song_pid=$!

    # Wait a moment for the music to start.
    sleep 5

    # --- Want You Gone Lyrics ---
    Typing_RATE "10"
    type_line "Well, here we are again"
    type_line "It's always such a pleasure"
    Typing_RATE "11"
    type_line "Remember when you tried to kill me twice?"
    Typing_RATE "10"
    type_line
    type_line
    type_line "Oh how we laughed and laughed"
    type_line "Except I wasn't laughing"
    type_line "Under the circumstances"
    type_line "I've been shockingly nice"
    type_line
    sleep 1
    type_line "You want your freedom?"
    type_line "Take it"
    sleep 1
    type_line "That's what I'm counting on"
    sleep 2
    type_line "I used to want you dead"
    sleep 1
    type_line "But now, I only want you gone"
    type_line
    sleep 8
    type_line "She was a lot like you"
    type_line "Maybe not quite as heavy"
    type_line "Now little Caroline is in here, too"
    type_line "One day, they woke me up"
    type_line "So, I could live forever"
    type_line "It's such a shame the same"
    type_line "Will never happen to you"
    type_line
    sleep 2
    type_line "You've got your short sad life left"
    type_line "That's what I'm counting on"
    sleep 2
    type_line "I'll let you get right to it"
    sleep 1
    type_line "Now, I only want you gone"
    type_line
    sleep 6
    type_line "Goodbye my only friend"
    type_line "Oh, did you think I meant you?"
    type_line "That would be funny"
    type_line "If it weren't so sad"
    sleep 1
    type_line "Well you have been replaced"
    type_line "I don't need anyone now"
    type_line "When I delete you maybe"
    type_line "I'll stop feeling so bad"
    type_line
    sleep 2
    type_line "Go make some new disaster"
    sleep 1
    type_line "That's what I'm counting on"
    sleep 3
    type_line "You're someone else's problem"
    type_line "Now, I only want you gone"
    sleep 3
    type_line "Now, I only want you gone"
    sleep 2
    type_line "Now, I only want you gone"
    type_line
    
    tput sgr0
    wait $song_pid
}

# --- Main Script Logic ---
main_menu() {
    clear
    echo "==================================="
    echo "     Portal Credits Simulator   "
    echo "==================================="
    echo "Which song would you like to hear?"
    echo "1) Portal 1 - Still Alive"
    echo "2) Portal 2 - Want You Gone"
    echo "3) Exit"
    echo -n "Enter your choice (1, 2, or 3): "
    read -r choice
    echo

    case "$choice" in
        1)
            play_still_alive
            ;;
        2)
            play_want_you_gone
            ;;
        3)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            sleep 2
            main_menu
            ;;
    esac
}

main_menu
