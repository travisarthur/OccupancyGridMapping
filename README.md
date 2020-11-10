# OccupancyGridMapping
 Implementation of creating a map from LiDar sensor data for EECE 4991
## Python Setup
The Python set up is simple and easy. If you already have Python installed on your machine you will need to verify that the version is compatible with MATLAB. The version of MATLAB installed on the machine you have will determine which version of python you will need to download. The following list shows the supported Python versions. The list does not include R2020a. R2020a supports 3.7, and 3.8.
![alt text](https://github.com/travisarthur/OccupancyGridMapping/blob/main/MATLABpyversions.PNG?raw=true)
Python downloads can be found at this link [Python Downloads](https://www.python.org/downloads/)
Once you have downloaded the version of Python that you need, then you will need to download the RpLidar Python Library from this link [RpLidar Python Library](https://pypi.org/project/rplidar/). 
Be sure that if you have multiple versions of Python that the RpLidar Library is installed in the same version that will be compatible with MATLAB.


## MATLAB Setup
In MATLAB command command window you will type in the command `pyenv`. Then you will see information that looks similar to the image below.
![alt text](https://github.com/travisarthur/OccupancyGridMapping/blob/main/PyenvSnip.PNG?raw=true)
If the version of Python is not recognized by MATLAB then you will have to set the path to the file version of Python. This is done with the command:

`pyenv('Version','FILEPATH TO THE PYTHON.EXE FOR THE COMPATIBLE VERSION')`

Any additional issues can be worked through using this link: [Python Config For MATLAB](https://www.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html#bujjwjn)

## Running The Program 
Other additional issue that might be encountered with using the programs projectTest.m and Scanner.py are mostly to deal with MATLAB note being able to find the Scanner.py file to call the run function. I resolved this issue by adding the folder that contains the projectTest.m and Scanner.py file in MATLAB's Set Path setting that can be found under the home tab in MATLAB. 

Once all the Setup stages are complete you can connect the RPLidar to your machine and then press the run button in the MATLAB IDE. After a couple seconds a window with the plot will appear.

## Additional Troubleshooting Guide
This setup is meant for Windows users with the COMPORT3 being utilized for the sensor. This system can work with Mac and Linux by changing the `lidar = RPLidar('COM3')` to your respective Port. 

Any issues with the RpLidar Library you can find the Github repo at this link: [RpLidar Library Repo](https://github.com/SkoltechRobotics/rplidar)

The Repo is currently no longer maintained. 
