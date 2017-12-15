From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 15 Dec 2017 11:20:41 +0000
Subject: rsi_91x: Low bandwidth: sends ~100 Kbits/sec, receives ~1.5
 Mbits/sec
In-Reply-To: <b4c2093d-cc2c-cdd3-52a5-73cefd2c189a@redpinesignals.com>
References: <1512490314.4977.143.camel@synopsys.com>
 <CAEhWJF=1GU9vOj5+DeJCOjbbh4zh_OMyv2HKH_1XT3XP2auFUg@mail.gmail.com>
 <1513277783.8750.27.camel@synopsys.com>
 <b4c2093d-cc2c-cdd3-52a5-73cefd2c189a@redpinesignals.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513336840.29404.21.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Prameela,

On Fri, 2017-12-15@11:13 +0530, Prameela Rani Garnepudi wrote:
> Hi Alexey, 
> 
> Please use the attached patch to improve TX throughput. We will be 
> submitting this patch along with few others soon. 

Could you please specify which branch this patch is based on?
I tried to apply on 4.14.5 (whatever is latests in "linux-4.14.y")
but first 3 hunks failed to apply.

Maybe there're other dependencies?

Also a couple of questions about this patch.
Even though I'm not a networking/Wi-Fi expert of any kind but just
looking at your changes:

1. I assume for upstreaming that patch will be split in 5 seperate patches
   each addressing its own item instead of doing all at once, right?

2. The only obvious change that might help me with bandwidth is increase
   of a number of aggregated Tx frames. But bumping from 6 to 8 doesn't look
   as a significant improvement. How that might bring Tx bandwidth at least to
   what I see on Rx, i.e. make things 10 times faster?

Also while at it I'm wondering why 5GHz mode didn't work for me even though
"iw list" reports 5 GHz mode supported:
----------------------->8------------------
# iw list
Wiphy phy0
...
      Frequencies:
           * 5180 MHz [36] (20.0 dBm) (no IR)

# cat /etc/hostapd.conf
interface=wlan0
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=HSDK-AP
hw_mode=a
channel=36

# hostapd -B /etc/hostapd.conf
Starting hostapd: Configuration file: /etc/hostapd.conf
rsi_91x: ===> Interface UP <===
rfkill: Cannot open RFKILL contrIPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
ol device
wlan0: IEEE 802.11 Configured channel (36) not found from the channel list of current mode (2) IEEE 802.11a
wlan0: IEEE 802.11 Hardware does not support configured channel
Could not select hw_mode and channel. (-3)
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED 
wlan0: Unable to setup interface.
wlan0: interface state DISABLED->DISABLED
wlan0: AP-DISABLED 
hostapd_free_hapd_data: Interface wlan0 wasn't started
----------------------->8------------------

Has it something to do with your another fix in that patch?

-Alexey
