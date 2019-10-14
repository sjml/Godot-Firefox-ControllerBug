extends Node2D

func _ready():
    var joys = Input.get_connected_joypads()
    for joyIdx in joys:
        if Input.is_joy_known(joyIdx):
            joy_con_changed(joyIdx, true)
    Input.connect("joy_connection_changed", self, "joy_con_changed")

func joy_con_changed(deviceID, isConnected):
    if isConnected:
        print("Joystick " + str(deviceID) + " connected")
        print("name: " + Input.get_joy_name(deviceID))
        if Input.is_joy_known(deviceID):
            print("Recognized joystick")
            print(Input.get_joy_name(deviceID) + " connected")
        else:
            print("Device not recognized.")
    else:
        print("Joystick " + str(deviceID) + " disconnected")