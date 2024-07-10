

from pyrogram import Client, errors
import time

# Initialize your Pyrogram client
app = Client("my_bot")

def handle_message(client, message):
    """ Example message handler function """
    # Your message handling logic here
    client.send_message(message.chat.id, "Hello!")

try:
    # Register message handler
    app.on_message(handle_message)

    # Start your Pyrogram client
    app.start()

except errors.FloodWait as e:
    # Handle FloodWait error
    wait_time = e.x
    print(f"Telegram is rate-limiting requests. Waiting for {wait_time} seconds...")
    time.sleep(wait_time)
    # Optionally, retry the operation that caused the FloodWait
    # Retry logic goes here

finally:
    # Clean up or perform any necessary actions before exiting
    app.stop()
