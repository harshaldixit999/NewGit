@echo off
setlocal

:: Get CPU Usage
echo Checking CPU Usage...
wmic cpu get loadpercentage

:: Get Memory Usage
echo Checking Memory Usage...
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize

:: Get Disk Space Usage
echo Checking Disk Space...
wmic logicaldisk get size,freespace,caption

:: List Top Running Processes
echo Listing Running Processes...
wmic process get name,workingsetsize | sort /R /+2

:: Save Output to a Log File
echo Saving health data to health_monitor.log...
wmic cpu get loadpercentage > health_monitor.log
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize >> health_monitor.log
wmic logicaldisk get size,freespace,caption >> health_monitor.log
wmic process get name,workingsetsize >> health_monitor.log

echo Health check complete! Log saved in health_monitor.log

endlocal
pause
