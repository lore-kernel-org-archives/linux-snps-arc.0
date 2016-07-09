From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Sat, 9 Jul 2016 08:37:55 +0000
Subject: DHCP via bridge in case of IPv4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1468053400.5007.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

I was playing with quite simple bridged setup on different boards with
very recent kernels (4.6.3 as of this writing) and found one interesting
behavior that I cannot yet understand and googling din't help here as well.

My setup is pretty simple:
-------------???????------------------???????-------------------------
| HOST??????|???????| "Dumb AP"??????|???????| Wireless client???????|
| with DHCP |<----->(eth0)?????(wlan0)<----->| attempting to?????????|
| server????|???????|????\ br0 /?????|???????| get settings via DHCP |
-------------???????------------------???????-------------------------

* HOST is my laptop with DHCP server that works for sure.
* "Dumb AP" is a separate board (I tried ARM-based Wandboard and ARC-based
? AXS10x boards but results are exactly the same) with wired (eth0) and wireless
? (wlan0) network controllers bridged together (br0). That "br0" bridge flawlessly
? gets its settings from DHCP server on host.
* Wireless client could be either a smatrphone or another laptop etc but
? what's important it should be configured to get network settings by DHCP as well.

So what happens "br0" always gets network settings from DHCP server on HOST.
That's fine. But wireless client only reliably gets settings from DHCP server
if IPv6 is enabled on "Dumb AP" board. If IPv6 is disabled I may see that
wireless client sends "DHCP Discover" then server replies with "DHCP Offer" but
that offer never reaches wireless client.

Well actually sometimes very-very rarely that offer may reach wireless client but
I cannot understand how to reproduce it reliably.

Still looks like enabling of IPv6 fixes that issue.

So my question here is: why I see that difference with IPv4 vs IPv6?

One sidenote:
? Somehow I figured out that in case of IPv4 so-called routing
? cache is absent (it was removed in Linux kernel 3.6) while with IPv6 it
? still exist. And assuming my hardware is sane and no data gets lost I may
? think that it's really a routing problem and missing routing cache might
? be an answer. Still being a noob in networking stuff I'd like to get a bit
? better explanation of things I see.

All thoughts and comments are more than welcome.

Regards,
Alexey
