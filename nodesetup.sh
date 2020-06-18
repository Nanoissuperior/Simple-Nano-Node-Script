echo "Hello, thank you for using my easy node script depending on the power of your server and your internet speed, this might take a while."
echo 
echo "This script is based on running as root, you can modify in any way needed to change locations etc."
echo 
echo 
echo "I am not responsible for any negative effects running this script will have, before running you should check you have downloaded the script from an official source and your server meets the required specs"
read -p "To agree and continue with the setup press enter now"
echo "Okay awesome, I'll get started :)"
echo "I am just going to install what is needed (curl, wget, 7zip)"
echo
echo
#Setup server requirements.
apt-get update -y 
apt-get upgrade -y 
apt-get install curl -y 
apt-get install wget -y 
apt install p7zip-full p7zip-rar -y 
echo 
echo
#Installing Docker
echo Time to install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
echo Just need to run another update
sudo apt-get update -y 
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
echo "
 +-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+
 |D|o|c|k|e|r| |i|s| |i|n|s|t|a|l|l|e|d| |:|)|
 +-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+
" 

#Install nano node and download ledger 
echo "Time to do the fun stuff (Nano)"
echo
echo
echo "docs.nano.org reccomend that you have at least 80GB free on your server before setting up a node, please see '/' below as this is where the node will be installed."
echo
df -h
echo
read -p "Press enter to confirm you have enough disk space (shown above). If you do not you can press ctrl + C to cancel this script and free up space before running again."
echo "Ok, lets do this!"
docker pull nanocurrency/nano
echo "Setting up node"

docker run --restart=unless-stopped -d  -p 7075:7075   -p 127.0.0.1:7076:7076   -v /home/:/root   --name nano_node   nanocurrency/nano:latest

#Check Docker was created and is running
if [ $(docker ps | grep nano_node | wc -l) -gt 0 ]
then
    echo "Docker Running!"

else
    echo "Something has gone wrong. The script is exiting"
    exit 
fi

echo "Time to do a blockcount check"
echo
curl -d '{ "action" : "block_count" }' 127.0.0.1:7076
echo "Node running, but lets get this node synced"

## download ledger and replace files

echo
docker stop nano_node
cd /home/Nano
echo
echo "Ok this next part takes a while, currently downloading the ledger from mynano.ninja"
echo
wget "https://mynano.ninja/api/ledger/download" -O ledger.7z

file=./ledger.7z
if [ -e "$file" ]; then
    echo "File exists, ledger downloaded lets carry on"
    echo
    echo "Phew, thats over, lets carry on"
    echo
    mv data.ldb data.ldb.old
    mv data.ldb-lock data.ldb-lock.old
    echo
    echo "This can also take a little while"
    echo
    7z e ledger.7z
    echo "looking good"
    echo
    docker start nano_node
    echo "lets check those blocks"
    echo
    sleep 6
    curl -d '{ "action" : "block_count" }' 127.0.0.1:7076
    echo
    echo "Okay I am all done here, you now have a fully synced node!" 
    echo "For any aditional options check out the docs or ask for help in discord!"
    echo "NanoIsSuperior"
else
    echo "Ledger failed to download, visit Nano discord for more help"
    exit
fi





