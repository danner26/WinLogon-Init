# WinLogon-Init
Powershell script that allows user to configure a startup script that will start a predefined list of programs. Customizable for the user, and useful features on program startup. Please read over the README for more information
WinLogon-Init is the project name for a highly customizable powershell script/module enabling the user to have various environment loaders. At the moment the only function is to start programs. Refer to the ToDo and Improvement section for future update information. To recommend an idea, please create a new issue.

This will be updated as I have time.. which I have a lot of at the moment.. so I will update it when I can.

## Logon Script or Task Schedule
As of now, this is the only way this script will run. I will be adding a module to simplify things for non-enterprise environments but right now this is it. If you would like to create the module before I do, let me know and feel free to create a fork.
### Logon Script Route
This is the preferable route in most enterprise environments that utilize client logon scripts. I highly prefer this as it allows me to control multiple logon actions, and ultimately start a defined set of applications.
### Task Schedule Route