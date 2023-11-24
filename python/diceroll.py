import random

def roll_dice():
    min_value = 1
    max_value = 6

    while True:
        # Rolling the dice and getting a random number between 1 and 6
        dice_roll = random.randint(min_value, max_value)
        print("You rolled:", dice_roll)

        # Asking the user if they want to roll the dice again
        roll_again = input("Do you want to roll the dice again? (yes/no): ").lower()
        
        if roll_again in ["yes", "y"]:
            continue
        else:
            print("Thanks for playing!")
            break

if __name__ == "__main__":
    roll_dice()
