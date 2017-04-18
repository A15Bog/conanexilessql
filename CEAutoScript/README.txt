=A15=Bog's Auto Script with FTP

This is an automated update process for your remote servers. It will download your game.db (works if it stays at 1 or 3 files), back up the unedited DB, run scripts against it, then reupload it. This does not work for SFTP or FTPS, only normal FTP.

It is setup to perform 3 functions automatically with different files:
-Perform Maintenance
-Wipe Server Except for Character Data
-Custom Script - ANYTHING YOU WANT

To use just:
1. download and extract to your computer in the C root to C:\CEAutoScript like this screenshot shows: http://imgur.com/a/gWef2 This has to be to the C root or it will not work due to static pathing.
2. Edit the two files name send_files.bat and get_files.bat in the EDIT_THESE folder. You need to put in your ftp username, ftp password, ftp port, and ftp server address for your conan server.
3. Also check that when you log into your FTP server normally, that the first folder you click on is "ConanSandBox". If it is not the FTP server pathing in send_files.bat and get_files.bat for the server also need to be edited.
4. If you are making a custom script, put it into CustomScript.sql in the EDIT_THESE folder.
5. Stop your server
6. execute the batch file located in any of these 3 folders depending on what you want to do: USE_Bog_Maintenance, USE_Wipe_Server, or USE_Custom_Script
7. When it completes, start your server.
