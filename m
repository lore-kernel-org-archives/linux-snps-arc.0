From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 16 Aug 2016 05:57:28 +0000
Subject: [LEDE-DEV] DHCP via bridge in case of IPv4
In-Reply-To: <1468217682.5588.4.camel@synopsys.com>
References: <1468053400.5007.5.camel@synopsys.com>
 <CAKNoO9oK-_sf=iGAW0caAhauLSbAW5YjDUi6gDnKsO6+W0Pcgg@mail.gmail.com>
 <1468065830.5007.10.camel@synopsys.com>
 <87shviklio.fsf@husum.klickitat.com> <1468217682.5588.4.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471326942.3980.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Mon, 2016-07-11@06:15 +0000, Alexey Brodkin wrote:
> Hi Russel,
> 
> On Sun, 2016-07-10@00:19 -0700, Russell Senior wrote:
> >?
> > > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin at synopsys.com> writes:
> > Alexey> Hi Aaron,
> > Alexey> On Sat, 2016-07-09@07:47 -0400, Aaron Z wrote:
> > >?
> > > > On Sat, Jul 9, 2016 at 4:37 AM, Alexey Brodkin
> > > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > >?
> > > > > Hello,
> > > > > 
> > > > > I was playing with quite simple bridged setup on different boards
> > > > with > very recent kernels (4.6.3 as of this writing) and found one
> > > > interesting > behavior that I cannot yet understand and googling
> > > > din't help here as well.
> > > > >?
> > > > > My setup is pretty simple: >
> > > > -------------???????------------------???????-------------------------
> > > > >?
> > > > > > HOST??????|???????| "Dumb AP"??????|???????| Wireless
> > > > client???????| > > with DHCP |<----->(eth0)?????(wlan0)<----->|
> > > > attempting to?????????| > > server????|???????|????\ br0
> > > > /?????|???????| get settings via DHCP | >
> > > > -------------???????------------------???????-------------------------
> > > > > * HOST is my laptop with DHCP server that works for sure.??> *
> > > > "Dumb AP" is a separate board (I tried ARM-based Wandboard and
> > > > ARC-based > ? AXS10x boards but results are exactly the same) with
> > > > wired (eth0) and wireless > ? (wlan0) network controllers bridged
> > > > together (br0). That "br0" bridge flawlessly > ? gets its settings
> > > > from DHCP server on host.??> * Wireless client could be either a
> > > > smatrphone or another laptop etc but > ? what's important it should
> > > > be configured to get network settings by DHCP as well.
> > > > > 
> > > > > So what happens "br0" always gets network settings from DHCP server
> > > > on HOST.??> That's fine. But wireless client only reliably gets
> > > > settings from DHCP server > if IPv6 is enabled on "Dumb AP" board. If
> > > > IPv6 is disabled I may see that > wireless client sends "DHCP
> > > > Discover" then server replies with "DHCP Offer" but > that offer
> > > > never reaches wireless client.
> > > > 
> > > > Do you have WDS enabled? If not, DHCP has issues in that scenario:
> > > > https://wiki.openwrt.org/doc/howto/clientmode
> > If the Dumb AP's wireless interface is in ap-mode, then this shouldn't
> > be an issue.??It's only client-mode interfaces that have trouble with bridging.
> > 
> > I'd suggest running tcpdump on the Dumb AP's wireless interface and the
> > client's wireless interface and see which of them sees the various parts
> > of the DHCP handshake.
> 
> So I did but for DHCP server and wireless client (had no tcpdump on Dump AP
> at the moment).
> 
> That's what I see on the server:
> ----------------------------->8-------------------------------
> No. Time????????Source?????Destination??????Protocol Length Info
> ?3 0.151181000??0.0.0.0????255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 11 2.760796000??10.42.0.1??10.42.0.13???????DHCP?????342????DHCP Offer????- Transaction ID 0x31dc321f
> 14 5.220985000??0.0.0.0????255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 15 5.221150000??10.42.0.1??10.42.0.13???????DHCP?????342????DHCP Offer????- Transaction ID 0x31dc321f
> 23 15.649835000 0.0.0.0????255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 24 15.650017000 10.42.0.1??10.42.0.13???????DHCP?????342????DHCP Offer????- Transaction ID 0x31dc321f
> 32 25.648589000 0.0.0.0????255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 33 25.648758000 10.42.0.1??10.42.0.13???????DHCP?????342????DHCP Offer????- Transaction ID 0x31dc321f
> 43 35.864567000 0.0.0.0????255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 48 38.832837000 10.42.0.1??10.42.0.13???????DHCP?????342????DHCP Offer????- Transaction ID 0x31dc321f
> ----------------------------->8-------------------------------
> 
> That's on the wireless client:
> ----------------------------->8-------------------------------
> No.??Time???????????Source???Destination??????Protocol Length Info
> 1171 94.192971000???0.0.0.0??255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 1182 99.263686000???0.0.0.0??255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 1185 109.692642000??0.0.0.0??255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 1186 119.691474000??0.0.0.0??255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> 1190 129.907507000??0.0.0.0??255.255.255.255??DHCP?????342????DHCP Discover - Transaction ID 0x31dc321f
> ----------------------------->8-------------------------------
> 
> I'll try to capture data from Dumb AP sometime soon and will reply to the thread.

So finally after quite some time I figured out what happens in my setup.
Basically it all boils down to the fact that DW GMAC doesn't enter promiscuous mode
when bridge gets created. To be more precise GMAC's MAC filter fail to enter promiscuous mode
and so packets from DHCP server sent to Wi-Fi clien are discarded by GMAC - that's why I cannot
see those packets in tcpdump output - CPU never gets any information about them.

I noticed that problem only happens if Ethernet PHY (in my case this is DP83865) doesn't have
link established. I.e. either:
?1) Cable is disconnected
?2) PHY is still negotiation link mode

Once PHY got link established GMAC happily enters promisq mode and all works as expected.

Unfortunately I cannot figure out why GMAC behaves that way. As per GMAC's databook the only reason
for it to not react on a register being written is missing input clock but there's no reason for the
clock to be missing and I don't seem to have a way to check if there's a problem with clock or not.

-Alexey
