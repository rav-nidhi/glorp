import keyboard
from gpiozero import OutputDevice
from time import sleep

class Rover:
    def __init__(self):
        # Enable pins
        self.left_enable = OutputDevice(22, active_high=True)  # ENA
        self.right_enable = OutputDevice(9, active_high=True)  # ENB

        # Control pins for motors
        self.left_motor_forward = OutputDevice(16)  # IN1
        self.left_motor_backward = OutputDevice(18)  # IN2
        self.right_motor_forward = OutputDevice(11)  # IN3
        self.right_motor_backward = OutputDevice(13)  # IN4

        # Enable both motor sets on startup
        self.left_enable.on()
        self.right_enable.on()

    def move(self, lf, lb, rf, rb):
        """Control both motor pairs."""
        self.left_motor_forward.value = lf
        self.left_motor_backward.value = lb
        self.right_motor_forward.value = rf
        self.right_motor_backward.value = rb

    def forward(self):
        print("Moving Forward")
        self.move(1, 0, 1, 0)

    def backward(self):
        print("Moving Backward")
        self.move(0, 1, 0, 1)

    def left(self):
        print("Turning Left")
        self.move(0, 0, 1, 0)  # Stop left motors, move right motors forward

    def right(self):
        print("Turning Right")
        self.move(1, 0, 0, 0)  # Stop right motors, move left motors forward

    def stop(self):
        print("Stopping")
        self.move(0, 0, 0, 0)

    def cleanup(self):
        """Release GPIO resources."""
        self.left_enable.off()
        self.right_enable.off()
        print("GPIO resources released.")

def keyboard_control():
    rover = Rover()
    print("Use W/A/S/D to control the rover. Press Q to quit.")

    try:
        while True:
            if keyboard.is_pressed('w'):
                rover.forward()
                sleep(0.1)

            elif keyboard.is_pressed('s'):
                rover.backward()
                sleep(0.1)

            elif keyboard.is_pressed('a'):
                rover.left()
                sleep(0.1)

            elif keyboard.is_pressed('d'):
                rover.right()
                sleep(0.1)

            elif keyboard.is_pressed('space'):
                rover.stop()
                sleep(0.1)

            elif keyboard.is_pressed('q'):
                rover.cleanup()
                break

    except KeyboardInterrupt:
        rover.cleanup()
        print("Program terminated.")

# Run the keyboard control function
keyboard_control()
