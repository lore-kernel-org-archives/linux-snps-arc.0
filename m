From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Sat, 9 Jul 2016 12:05:07 +0000
Subject: [LEDE-DEV] DHCP via bridge in case of IPv4
In-Reply-To: <CAKNoO9oK-_sf=iGAW0caAhauLSbAW5YjDUi6gDnKsO6+W0Pcgg@mail.gmail.com>
References: <1468053400.5007.5.camel@synopsys.com>
 <CAKNoO9oK-_sf=iGAW0caAhauLSbAW5YjDUi6gDnKsO6+W0Pcgg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1468065830.5007.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Aaron,

On Sat, 2016-07-09@07:47 -0400, Aaron Z wrote:
> On Sat, Jul 9, 2016 at 4:37 AM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> > 
> > Hello,
> > 
> > I was playing with quite simple bridged setup on different boards with
> > very recent kernels (4.6.3 as of this writing) and found one interesting
> > behavior that I cannot yet understand and googling din't help here as well.
> > 
> > My setup is pretty simple:
> > -------------???????------------------???????-------------------------
> > > 
> > > HOST??????|???????| "Dumb AP"??????|???????| Wireless client???????|
> > > with DHCP |<----->(eth0)?????(wlan0)<----->| attempting to?????????|
> > > server????|???????|????\ br0 /?????|???????| get settings via DHCP |
> > -------------???????------------------???????-------------------------
> > 
> > * HOST is my laptop with DHCP server that works for sure.
> > * "Dumb AP" is a separate board (I tried ARM-based Wandboard and ARC-based
> > ? AXS10x boards but results are exactly the same) with wired (eth0) and wireless
> > ? (wlan0) network controllers bridged together (br0). That "br0" bridge flawlessly
> > ? gets its settings from DHCP server on host.
> > * Wireless client could be either a smatrphone or another laptop etc but
> > ? what's important it should be configured to get network settings by DHCP as well.
> > 
> > So what happens "br0" always gets network settings from DHCP server on HOST.
> > That's fine. But wireless client only reliably gets settings from DHCP server
> > if IPv6 is enabled on "Dumb AP" board. If IPv6 is disabled I may see that
> > wireless client sends "DHCP Discover" then server replies with "DHCP Offer" but
> > that offer never reaches wireless client.
> 
>
> Do you have WDS enabled? If not, DHCP has issues in that scenario:
> https://wiki.openwrt.org/doc/howto/clientmode

I don't have WDS enabled. I tried to have as simple setup as possible.
Still from what I see in the Wiki article above problem happens when
there're 4 devices in the chain, right? Because as it says:
------------------------>8------------------------
The 802.11 standard only uses three MAC addresses for frames transmitted between
the Access Point and the Station. Frames transmitted from the Station to the AP
don't include the ethernet source MAC of the requesting host and response frames
are missing the destination ethernet MAC to address the target host behind the
client bridge.
------------------------>8------------------------

But in my case I only have 3 devices in the chain so I would think it's
something else but issue described in the article.

Anyways thanks for the hint.

-Alexey
