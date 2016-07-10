From: russell@personaltelco.net (Russell Senior)
Date: Sun, 10 Jul 2016 00:19:43 -0700
Subject: [LEDE-DEV] DHCP via bridge in case of IPv4
In-Reply-To: <1468065830.5007.10.camel@synopsys.com> (Alexey Brodkin's message
 of "Sat, 9 Jul 2016 12:05:07 +0000")
References: <1468053400.5007.5.camel@synopsys.com>
 <CAKNoO9oK-_sf=iGAW0caAhauLSbAW5YjDUi6gDnKsO6+W0Pcgg@mail.gmail.com>
 <1468065830.5007.10.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87shviklio.fsf@husum.klickitat.com>
To: linux-snps-arc@lists.infradead.org

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin at synopsys.com> writes:

Alexey> Hi Aaron,
Alexey> On Sat, 2016-07-09@07:47 -0400, Aaron Z wrote:
>> On Sat, Jul 9, 2016 at 4:37 AM, Alexey Brodkin
>> <Alexey.Brodkin@synopsys.com> wrote:
>> > 
>> > Hello,
>> > 
>> > I was playing with quite simple bridged setup on different boards
>> with > very recent kernels (4.6.3 as of this writing) and found one
>> interesting > behavior that I cannot yet understand and googling
>> din't help here as well.
>> > 
>> > My setup is pretty simple: >
>> -------------???????------------------???????-------------------------
>> > > 
>> > > HOST??????|???????| "Dumb AP"??????|???????| Wireless
>> client???????| > > with DHCP |<----->(eth0)?????(wlan0)<----->|
>> attempting to?????????| > > server????|???????|????\ br0
>> /?????|???????| get settings via DHCP | >
>> -------------???????------------------???????-------------------------
>> > 
>> > * HOST is my laptop with DHCP server that works for sure.  > *
>> "Dumb AP" is a separate board (I tried ARM-based Wandboard and
>> ARC-based > ? AXS10x boards but results are exactly the same) with
>> wired (eth0) and wireless > ? (wlan0) network controllers bridged
>> together (br0). That "br0" bridge flawlessly > ? gets its settings
>> from DHCP server on host.  > * Wireless client could be either a
>> smatrphone or another laptop etc but > ? what's important it should
>> be configured to get network settings by DHCP as well.
>> > 
>> > So what happens "br0" always gets network settings from DHCP server
>> on HOST.  > That's fine. But wireless client only reliably gets
>> settings from DHCP server > if IPv6 is enabled on "Dumb AP" board. If
>> IPv6 is disabled I may see that > wireless client sends "DHCP
>> Discover" then server replies with "DHCP Offer" but > that offer
>> never reaches wireless client.
>> 
>> 
>> Do you have WDS enabled? If not, DHCP has issues in that scenario:
>> https://wiki.openwrt.org/doc/howto/clientmode

If the Dumb AP's wireless interface is in ap-mode, then this shouldn't
be an issue.  It's only client-mode interfaces that have trouble with bridging.

I'd suggest running tcpdump on the Dumb AP's wireless interface and the
client's wireless interface and see which of them sees the various parts
of the DHCP handshake.


-- 
Russell Senior, President
russell at personaltelco.net
