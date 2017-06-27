From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 07:25:39 +0300
Subject: stdout-path (was Re: [PATCH 3/3 v6] ARC: hsdk: initial port for HSDK
 board)
In-Reply-To: <1498494334.28955.58.camel@synopsys.com>
References: <20170626151118.19507-1-Eugeniy.Paltsev@synopsys.com>
 <20170626151118.19507-4-Eugeniy.Paltsev@synopsys.com>
 <CAL_JsqJBPL+AuYNP=JgXWOGNFxdenKY4Rt3_f6tG6MYDLncRNg@mail.gmail.com>
 <1498494334.28955.58.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5abefbed-fd4d-0564-e99c-e17f6a1445b5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/26/2017 07:25 PM, Alexey Brodkin wrote:
>>> +
>>> +       chosen {
>>> +               bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
>> Use stdout-path for the console. Really, the bootargs should be blank
>> and populated by the bootloader especially debug options.
> Agree but in case of devboards we quite often disable bootloader and
> load Linux image in memory via JTAG. So in that case bootargs make perfect sense IMH

FWIW, I tried this 2 years ago (v4.1 ish) per pestering by Arnd but at the time I 
had to add some hacks in early 8250 driver to get this working for ARC.

See,
http://www.spinics.net/lists/linux-serial/msg17742.html
http://www.spinics.net/lists/linux-serial/msg17747.html

We can certainly revisit this now.

-Vineet
