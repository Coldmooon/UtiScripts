sudo networksetup -setdnsservers Thunderbolt 10.3.9.4 \
                                             10.3.9.5 \
                                             10.3.9.6 \
                                             114.114.114.114 \
                                             2001:470:0:45::2 \
                                             2001:470:20::2 \
                                             2001:4860:4860::8888 \
                                             2001:4860:4860::8844
                                             
# sudo networksetup -setdnsservers Wi-Fi 10.3.9.4 \
#                                        10.3.9.5 \
#                                        10.3.9.6 \
#                                        114.114.114.114 \
#                                        2001:470:0:45::2 \
#                                        2001:470:20::2 \
#                                        2001:4860:4860::8888 \
#                                        2001:4860:4860::8844
#                                        
sudo networksetup -setdnsservers Wi-Fi 114.114.114.114 
                                      
#                                        
echo "Now DNS for Thunderbolt are:"

networksetup -getdnsservers Thunderbolt

echo "While DNS for Wi-Fi are:"

networksetup -getdnsservers Wi-Fi

sudo discoveryutil udnsflushcaches