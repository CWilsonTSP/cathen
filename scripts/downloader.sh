#!/bin/sh

echo This command will download the encyclopedia files from NewAdvent. 
echo This will take a while. We are downloading the entire thing,
echo including the files and webpages which are linked or references
echo in the articles. (I will fix this later...)
echo We will begin my purging any download we currently have.
read -p "Type 'yes' to continue, or anything else to cancel: " confirmation

if [[ "$confirmation" == "yes" ]]; then
    echo "Continuing with the second part of your script."
        # Your script continues here
        rm -rf www.newadvent.org/
        wget -mpEk "https://www.newadvent.org/cathen/"
else
    echo "Confirmation not received. Exiting."
fi

