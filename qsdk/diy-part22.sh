sed -i 's/192.168.6.1/192.168.10.12/g' package/base-files/files/bin/config_generate
sed -i 's/SSID1=Redmi_AX6000_5G/SSID1=123123/g' package/mtk/luci-app-mtwifi/files/mt7615.2.dat
sed -i 's/SSID1=Redmi_AX6000_2G/SSID1=123123_2.4/g' package/mtk/luci-app-mtwifi/files/mt7615.1.dat
