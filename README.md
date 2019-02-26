Django Todo App in Docker
=========================

This is an example project for a 
[blog post on the PyCharm blog](https://www.jetbrains.com/help/pycharm/using-docker-compose-as-a-remote-interpreter.html#debug).
Please read more about it there.

To run the project, set up a Django compatible database (I use PostgreSQL but you're welcome to use something else)
and configure it in `djangodocker/settings.py`. 

To see the Docker version of this code, see the `dockerized` branch of this repo.

## Tips for making the example project work
I pulled the example code from Git and followed exact steps on the aforementioned blog, however it did not work. I cannot
even get the docker-compose be the remote interpreter in pyCharm. Several days of effort was put on searching for solutions. 
Finally I figured out the workarounds.

### Install Docker for Desktop on Windows 10 Enterprise and set it properly
Here are a few things need your attention while setting up Docker on Win10 Enterprise.   
1. Enable Hyper-V on the host. 
2. Ensure Linux containers are used. Go to Docker icon and right click, select "Switch to Linux containers".
If it throws out errors as it did to me previously, I would recommend the following steps to give it a shot.   
   2.1 Disable Hyper-V on "Turn Windows features on or off" 
   2.2 Reboot and open PowerShell as administrator
   2.3 On PowerShell, execute the command: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`   
3. On Docker settings,    
   2.1 Enable "Expose daemon on tcp://localhost:2375 without TLS" under "General". This allows you to use
   Docker as Build and Debug engine on PyCharm.   
   2.2 Enable C drive on "Share Drives"
   2.3 Under "Daemon" tab, choose "Advance" where you can set "experimental" to "true". 
 
### Configure Pycharm 
You can follow the aforementioned blog to setup docker-compose as the remote interpreter on PyCharm.
One thing to be noted is that before running/debugging the Django app, you have to migrate the database. You can 
follow this [tutorial](https://www.jetbrains.com/help/pycharm/running-manage-py.html) to set up manage.py utility on 
PyCharm. Afterwards, pres Ctrl+Alt+R to starts the manage.py console. You would get a console looks like:
`manage.py@djangodocker-master>`  
On the console, type `migrate`.