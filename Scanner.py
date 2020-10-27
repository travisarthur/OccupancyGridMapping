from rplidar import RPLidar
import matlab

def run(num):
    # Tells rplidar Library which port to access.
    lidar = RPLidar('COM3')


    # Create empty  list
    scan = []
    # Loops through the iterator scans appending the packet of data to scan
    # stops after 5 scan packets
    for data in lidar.iter_scans():
        scan.append(data)
        if len(scan) > 5:
            break
    # newScan is a single list composed of the five scans of data
    newScan = scan[0]+scan[1]+scan[2]+scan[3]+scan[4]

    # Empty lists to be appended to in the while loop.
    distScan = []
    thetaScan = []
    j = 0
    while(j<len(newScan)):
        # Example of newScan list contents look like
        # newScan = [[(Quality,Angle in Deg, Dist in Cm),....]]
        thetaScan.append(newScan[j][1])
        distScan.append(newScan[j][2])
        j = j + 1
    # Single list output to return to MATLAB

    output = [distScan, thetaScan]
    return output
    # Stops the retrieval of scan data to the buffer.
    lidar.stop()
    # Disconnects link to the COMPORT.
    lidar.disconnect()



if __name__ == '__main__':
    run(1)

