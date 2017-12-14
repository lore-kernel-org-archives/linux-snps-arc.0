From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 14 Dec 2017 18:56:24 +0000
Subject: rsi_91x: Low bandwidth: sends ~100 Kbits/sec, receives ~1.5 Mbits/sec
In-Reply-To: <CAEhWJF=1GU9vOj5+DeJCOjbbh4zh_OMyv2HKH_1XT3XP2auFUg@mail.gmail.com>
References: <1512490314.4977.143.camel@synopsys.com>
 <CAEhWJF=1GU9vOj5+DeJCOjbbh4zh_OMyv2HKH_1XT3XP2auFUg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513277783.8750.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Amitkumar,

Yet another observation with RS-9113 module.
I managed to setup an access point on my board with RS-9113 connected either
via SDIO (this one is soldered on my board) or via USB (this is your RS9113
Evaluation Board Rev 4.0).

But regardless the module I use I still see the same bandwidth figures.
RS-9113 sends data at ~100 Kbits and receives at ~1.5-2 Mbits.
See below results of iperf3 runs (from development host side).

The board with RS-9113 acts as a server:
------------------------------------>8-----------------------------------
# iperf3 -c 192.168.111.1
Connecting to host 192.168.111.1, port 5201
[  4] local 192.168.111.64 port 43430 connected to 192.168.111.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec   328 KBytes  2.68 Mbits/sec    0   31.1 KBytes       
[  4]   1.00-2.00   sec  63.6 KBytes   521 Kbits/sec    1   31.1 KBytes       
[  4]   2.00-3.00   sec   191 KBytes  1.57 Mbits/sec    0   31.1 KBytes       
[  4]   3.00-4.00   sec   191 KBytes  1.56 Mbits/sec    0   32.5 KBytes       
[  4]   4.00-5.00   sec   191 KBytes  1.56 Mbits/sec    0   36.8 KBytes       
[  4]   5.00-6.00   sec  63.6 KBytes   521 Kbits/sec    0   38.2 KBytes       
[  4]   6.00-7.00   sec  63.6 KBytes   521 Kbits/sec    0   38.2 KBytes       
[  4]   7.00-8.00   sec   191 KBytes  1.56 Mbits/sec    0   48.1 KBytes       
[  4]   8.00-9.00   sec   255 KBytes  2.09 Mbits/sec    0   48.1 KBytes       
[  4]   9.00-10.00  sec   191 KBytes  1.56 Mbits/sec    0   48.1 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  1.69 MBytes  1.42 Mbits/sec    1             sender
[  4]   0.00-10.00  sec  1.39 MBytes  1.16 Mbits/sec                  receiver
------------------------------------>8-----------------------------------

The board with RS-9113 acts as a server (but with "-R" it sends us data now):
------------------------------------>8-----------------------------------
# iperf3 -c 192.168.111.1 -R
Connecting to host 192.168.111.1, port 5201
Reverse mode, remote host 192.168.111.1 is sending
[  4] local 192.168.111.64 port 45230 connected to 192.168.111.1 port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.14   sec  15.6 KBytes   112 Kbits/sec                  
[  4]   1.14-2.00   sec  2.83 KBytes  27.0 Kbits/sec                  
[  4]   2.00-3.00   sec  12.7 KBytes   104 Kbits/sec                  
[  4]   3.00-4.00   sec  14.1 KBytes   116 Kbits/sec                  
[  4]   4.00-5.00   sec  12.7 KBytes   104 Kbits/sec                  
[  4]   5.00-6.00   sec  14.1 KBytes   116 Kbits/sec                  
[  4]   6.00-7.00   sec  14.1 KBytes   116 Kbits/sec                  
[  4]   7.00-8.00   sec  12.7 KBytes   104 Kbits/sec                  
[  4]   8.00-9.00   sec  14.1 KBytes   116 Kbits/sec                  
[  4]   9.00-10.00  sec  12.7 KBytes   104 Kbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   296 KBytes   242 Kbits/sec    2             sender
[  4]   0.00-10.00  sec   254 KBytes   208 Kbits/sec                  receiver	
------------------------------------>8-----------------------------------

My configurations are as below.
hostapd.conf:
------------------------------------>8-----------------------------------
interface=wlan0
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=AP_NAME
hw_mode=g
channel=1
------------------------------------>8-----------------------------------

wpa_supplicant.conf
------------------------------------>8-----------------------------------
ctrl_interface=/var/run/wpa_supplicant
ap_scan=1

network={
	ssid="AP_NAME"
	psk="password"
}
------------------------------------>8-----------------------------------

Note I use vanilla Linux v4.14.4.

I'm wondering if you may see different results in your setup and if so
could you please suggest something for me to try.


Thanks in advance,
Alexey

P.S. I do remember about my previous email but so far I was not able to
get with the board to the place with "problematic" Wi-FI AP, once I get
there I'll grab longs for you.
