sed -i 's/192.168.6.1/192.168.10.12/g' package/base-files/files/bin/config_generate
sed -i 's/SSID1=Redmi_AX6000_5G/SSID1=123123/g' package/mtk/luci-app-mtwifi/files/mt7615.2.dat
sed -i 's/SSID1=Redmi_AX6000_2G/SSID1=123123_2.4/g' package/mtk/luci-app-mtwifi/files/mt7615.1.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=88896825/g' package/mtk/luci-app-mtwifi/files/mt7615.1.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=88896825/g' package/mtk/luci-app-mtwifi/files/mt7615.2.dat


#增加mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns
git clone https://github.com/sbwml/v2ray-geodata.git package/v2ray-geodata

git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone https://github.com/sirpdboy/netspeedtest package/netspeedtest


