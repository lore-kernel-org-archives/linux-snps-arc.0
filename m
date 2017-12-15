From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 15 Dec 2017 13:21:34 +0000
Subject: rsi_91x: Low bandwidth: sends ~100 Kbits/sec, receives ~1.5
 Mbits/sec
In-Reply-To: <3f553fb0-d1d2-59f1-32f3-53e993c544ca@redpinesignals.com>
References: <1512490314.4977.143.camel@synopsys.com>
 <CAEhWJF=1GU9vOj5+DeJCOjbbh4zh_OMyv2HKH_1XT3XP2auFUg@mail.gmail.com>
 <1513277783.8750.27.camel@synopsys.com>
 <b4c2093d-cc2c-cdd3-52a5-73cefd2c189a@redpinesignals.com>
 <1513336840.29404.21.camel@synopsys.com>
 <3f553fb0-d1d2-59f1-32f3-53e993c544ca@redpinesignals.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513344093.29404.26.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Prameela,

On Fri, 2017-12-15@18:14 +0530, Prameela Rani Garnepudi wrote:
> Hi Alexey, 
> 
> 
> On Friday 15 December 2017 04:50 PM, Alexey Brodkin wrote: 
> > Hi Prameela, 
> > 
> > On Fri, 2017-12-15 at 11:13 +0530, Prameela Rani Garnepudi wrote: 
> >> Hi Alexey, 
> >> 
> >> Please use the attached patch to improve TX throughput. We will be 
> >> submitting this patch along with few others soon. 
> > Could you please specify which branch this patch is based on? 
> > I tried to apply on 4.14.5 (whatever is latests in "linux-4.14.y") 
> > but first 3 hunks failed to apply. 
> It is based on 4.14.0-rc7+ 
> > 
> > Maybe there're other dependencies? 
> > 
> > Also a couple of questions about this patch. 
> > Even though I'm not a networking/Wi-Fi expert of any kind but just 
> > looking at your changes: 
> > 
> > 1. I assume for upstreaming that patch will be split in 5 seperate patches 
> >    each addressing its own item instead of doing all at once, right? 
> > 
> > 2. The only obvious change that might help me with bandwidth is increase 
> >    of a number of aggregated Tx frames. But bumping from 6 to 8 doesn't look 
> >    as a significant improvement. How that might bring Tx bandwidth at least to 
> >    what I see on Rx, i.e. make things 10 times faster? 
> 
> The significant change to improve performance is bootup parameters 
> update as below: 
> 
> diff --git a/drivers/net/wireless/rsi/rsi_boot_params.h 
> b/drivers/net/wireless/rsi/rsi_boot_params.h 
> index 238ee96..ad903b22 100644 
> --- a/drivers/net/wireless/rsi/rsi_boot_params.h 
> +++ b/drivers/net/wireless/rsi/rsi_boot_params.h 
> @@ -46,7 +46,8 @@ 
>         (((TA_PLL_M_VAL_20 + 1) * 40) / \ 
>          ((TA_PLL_N_VAL_20 + 1) * (TA_PLL_P_VAL_20 + 1))) 
>  #define VALID_20 \ 
> -       (WIFI_PLL960_CONFIGS | WIFI_AFEPLL_CONFIGS | 
> WIFI_SWITCH_CLK_CONFIGS) 
> +       (WIFI_TAPLL_CONFIGS | WIFI_PLL960_CONFIGS | WIFI_AFEPLL_CONFIGS | \ 
> +        WIFI_SWITCH_CLK_CONFIGS | BOOTUP_MODE_INFO | CRYSTAL_GOOD_TIME) 
>  #define UMAC_CLK_40BW   \ 
>         (((TA_PLL_M_VAL_40 + 1) * 40) / \ 
>          ((TA_PLL_N_VAL_40 + 1) * (TA_PLL_P_VAL_40 + 1))) 
> 

With this change alone I don't see any improvement, see iperf3 results before this change:
--------------------------->8-------------------------
Accepted connection from 10.42.1.85, port 33814
[  5] local 10.42.1.1 port 5201 connected to 10.42.1.85 port 33816
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   1.00-2.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   2.00-3.00   sec  14.1 KBytes   116 Kbits/sec                  
[  5]   3.00-4.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   4.00-5.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   5.00-6.00   sec  11.3 KBytes  92.7 Kbits/sec                  
[  5]   6.00-7.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   7.00-8.00   sec  11.3 KBytes  92.7 Kbits/sec                  
[  5]   8.00-9.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   9.00-10.00  sec  12.7 KBytes   104 Kbits/sec                  
[  5]  10.00-11.00  sec  12.7 KBytes   104 Kbits/sec                  
[  5]  11.00-12.00  sec  12.7 KBytes   104 Kbits/sec                  
[  5]  12.00-12.44  sec  5.66 KBytes   107 Kbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-12.44  sec   157 KBytes   103 Kbits/sec                  receiver

Accepted connection from 10.42.1.85, port 33818
[  5] local 10.42.1.1 port 5201 connected to 10.42.1.85 port 33820
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   296 KBytes  2.42 Mbits/sec    0   41.0 KBytes       
[  5]   1.00-2.00   sec   137 KBytes  1.12 Mbits/sec    0   46.7 KBytes       
[  5]   2.00-3.00   sec   127 KBytes  1.04 Mbits/sec    0   53.7 KBytes       
[  5]   3.00-4.00   sec   127 KBytes  1.04 Mbits/sec    0   62.2 KBytes       
[  5]   4.00-5.00   sec   191 KBytes  1.56 Mbits/sec    0   82.0 KBytes       
[  5]   5.00-6.00   sec   191 KBytes  1.56 Mbits/sec    0    113 KBytes       
[  5]   6.00-7.00   sec   573 KBytes  4.69 Mbits/sec    0    158 KBytes       
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0    187 KBytes       
[  5]   8.00-9.00   sec   445 KBytes  3.65 Mbits/sec    0    243 KBytes       
[  5]   9.00-10.00  sec   636 KBytes  5.22 Mbits/sec    0    298 KBytes       
[  5]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec    0    362 KBytes       
[  5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec    0    399 KBytes       
[  5]  12.00-12.87  sec   827 KBytes  7.80 Mbits/sec    0    455 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-12.87  sec  3.47 MBytes  2.26 Mbits/sec    0             sender
--------------------------->8-------------------------

and right after:
--------------------------->8-------------------------
Accepted connection from 10.42.1.85, port 60582
[  5] local 10.42.1.1 port 5201 connected to 10.42.1.85 port 60584
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   1.00-2.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   2.00-3.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   3.00-4.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   4.00-5.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   5.00-6.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   6.00-7.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   7.00-8.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   8.00-9.00   sec  12.7 KBytes   104 Kbits/sec                  
[  5]   9.00-10.00  sec  12.7 KBytes   104 Kbits/sec                  
[  5]  10.00-11.00  sec  12.7 KBytes   104 Kbits/sec                  
[  5]  11.00-12.00  sec  14.1 KBytes   116 Kbits/sec                  
[  5]  12.00-12.51  sec  5.66 KBytes  90.5 Kbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-12.51  sec   160 KBytes   105 Kbits/sec                  receiver
-----------------------------------------------------------

Accepted connection from 10.42.1.85, port 60586
[  5] local 10.42.1.1 port 5201 connected to 10.42.1.85 port 60588
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   296 KBytes  2.42 Mbits/sec    0   42.4 KBytes       
[  5]   1.00-2.00   sec   137 KBytes  1.12 Mbits/sec    0   48.1 KBytes       
[  5]   2.00-3.00   sec   127 KBytes  1.04 Mbits/sec    0   53.7 KBytes       
[  5]   3.00-4.00   sec   127 KBytes  1.04 Mbits/sec    0   62.2 KBytes       
[  5]   4.00-5.00   sec   318 KBytes  2.61 Mbits/sec    0   80.6 KBytes       
[  5]   5.00-6.00   sec   255 KBytes  2.08 Mbits/sec    0    112 KBytes       
[  5]   6.00-7.00   sec   318 KBytes  2.61 Mbits/sec    0    153 KBytes       
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0    188 KBytes       
[  5]   8.00-9.00   sec   509 KBytes  4.17 Mbits/sec    0    233 KBytes       
[  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec    0    270 KBytes       
[  5]  10.00-11.00  sec   573 KBytes  4.69 Mbits/sec    0    345 KBytes       
[  5]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec    0    387 KBytes       
[  5]  12.00-12.66  sec   954 KBytes  11.8 Mbits/sec    0    414 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-12.66  sec  3.53 MBytes  2.34 Mbits/sec    0             sender
--------------------------->8-------------------------

Any ideas?
Does it really work for you (again I'm trying on top of linux-4.14.y)?

> > 
> > Also while at it I'm wondering why 5GHz mode didn't work for me even though 
> > "iw list" reports 5 GHz mode supported: 
> > ----------------------->8------------------ 
> > # iw list 
> > Wiphy phy0 
> > ... 
> >       Frequencies: 
> >            * 5180 MHz [36] (20.0 dBm) (no IR) 
> > 
> > # cat /etc/hostapd.conf 
> > interface=wlan0 
> > ctrl_interface=/var/run/hostapd 
> > ctrl_interface_group=0 
> > ssid=HSDK-AP 
> > hw_mode=a 
> > channel=36 
> > 
> > # hostapd -B /etc/hostapd.conf 
> > Starting hostapd: Configuration file: /etc/hostapd.conf 
> > rsi_91x: ===> Interface UP <=== 
> > rfkill: Cannot open RFKILL contrIPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready 
> > ol device 
> > wlan0: IEEE 802.11 Configured channel (36) not found from the channel list of current mode (2) IEEE 802.11a 
> > wlan0: IEEE 802.11 Hardware does not support configured channel 
> > Could not select hw_mode and channel. (-3) 
> > wlan0: interface state UNINITIALIZED->DISABLED 
> > wlan0: AP-DISABLED 
> > wlan0: Unable to setup interface. 
> > wlan0: interface state DISABLED->DISABLED 
> > wlan0: AP-DISABLED 
> > hostapd_free_hapd_data: Interface wlan0 wasn't started 
> > ----------------------->8------------------ 
> It should work without any issues. I hope you have dual band module with 
> you. Please confirm once. 

1. How may I tell the module supports 5GHz?
2. If it doesn't support 5GHz why iw reports this support?

-Alexey
