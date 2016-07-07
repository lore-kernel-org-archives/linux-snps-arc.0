From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 7 Jul 2016 05:16:08 +0000
Subject: ath9k-htc on OHCI -> bogus usb xfer
In-Reply-To: <577CDE24.2030600@de.bosch.com>
References: <1467721137.3144.81.camel@synopsys.com>
 <577BED2D.7070209@rempel-privat.de> <1467739821.3086.13.camel@synopsys.com>
 <577C041C.7080905@rempel-privat.de> <1467790987.3086.15.camel@synopsys.com>
 <577CC035.1000404@de.bosch.com> <1467793848.3086.37.camel@synopsys.com>
 <577CC3A2.5070607@de.bosch.com> <1467794679.3086.42.camel@synopsys.com>
 <577CCAB8.90003@de.bosch.com> <1467797356.3086.48.camel@synopsys.com>
 <577CDE24.2030600@de.bosch.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467868495.23055.1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi?Oleksij,

On Wed, 2016-07-06@12:32 +0200, fixed-term.Oleksij.Rempel wrote:
> 
> On 06.07.2016 11:30, Alexey Brodkin wrote:
> > 
> > Hi Oleksij,
> > 
> > On Wed, 2016-07-06@11:09 +0200, fixed-term.Oleksij.Rempel wrote:
> > > 
> > > 
> > > On 06.07.2016 10:45, Alexey Brodkin wrote:
> > > > 
> > > > 
> > > > Hi Oleksij,
> > > > 
> > > > On Wed, 2016-07-06@10:38 +0200, fixed-term.Oleksij.Rempel wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 06.07.2016 10:32, Alexey Brodkin wrote:
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > Hi Oleksij,
> > > > > > 
> > > > > > On Wed, 2016-07-06@10:24 +0200, fixed-term.Oleksij.Rempel wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > ?
> > > > > > > Hm... this Endpoint should be Interrupt, not Bulk. If you search for
> > > > > > > lsusb of this kind of adapter all of them list EP3 and EP4 as Interrupt.
> > > > > > > 
> > > > > > > what did went wrong here? Is it not working in USB High Speed mode?
> > > > > > Unfortunately as of now on that board EHCI doesn't work.
> > > > > > 
> > > > > > That's not a problem of a particular USB device but something in either
> > > > > > ECHI host controller or its integration. I do hope we will fix it sometime soon
> > > > > > (this is a development board and USB controller is implemented in FPGA so
> > > > > > there's a chance to fix stuff later on).
> > > > > > 
> > > > > > So given only OHCI works on the board I went forward and attempted to use it
> > > > > > with Wi-Fi USB dongle.
> > > > > I did some tests for 2 years on OHCI controller on x86. There was no
> > > > > noticable issues. It was even a bit faster then Intels EHCI. I don't
> > > > > think OHCI alone is the source of this problem.
> > > > Well I was also surprised how well that dongle works with that board in
> > > > OHCI mode. I saw quite consistent ~4-5 Mbit/second rates when doing Speedtest
> > > > from my smartphone. So IMHO it's completely usable. Especially on that kind of
> > > > HW which has main CPU running at just 100MHz.
> > > > 
> > > > > 
> > > > > 
> > > > > On other side, so far i know, this adapter claims to provide usb full
> > > > > speed support, (Not only high speed) and may use different usb
> > > > > descriptor for this. May be this is the problem.
> > > > So is there something we may do with all that?
> > > Sure...
> > > 
> > > This shows that EP4 is Bluk in full speed mode. And it is defined by a
> > > boot loader of this chip:
> > > grep -R USB_FS_EP4_ATTRIBUTE *
> > > sboot/magpie_1_1/sboot/hif/usb/src/usb_table.c:
> > > m2BYTE(USB_FS_EP4_ATTRIBUTE, USB_FS_EP4_MAX_PACKET_SIZE),
> > > sboot/magpie_1_1/sboot/hif/usb/src/usb_table.h:#define
> > > USB_FS_EP4_ATTRIBUTE????????????bUSB_EP_TYPE_BULK
> > > sboot/magpie_1_1/inc/usb_table.h:#define USB_FS_EP4_ATTRIBUTE
> > > ?bUSB_EP_TYPE_BULK
> > > target_firmware/magpie_fw_dev/target/inc/k2/usb_table.h:#define
> > > USB_FS_EP4_ATTRIBUTE????????????bUSB_EP_TYPE_BULK
> > > target_firmware/magpie_fw_dev/target/inc/magpie/usb_table.h:#define
> > > USB_FS_EP4_ATTRIBUTE????????????bUSB_EP_TYPE_BULK
> > > 
> > > 
> > > So, there are fallowing variants to fix it:
> > > a) patch full speed usb descriptor in firmware and add usb reinit
> > > support to the driver.
> > > b) add support of different EP4 types.
> > > 
> > > In any case, some one need to implement it... right now i have time only
> > > for mentoring.
> > That's understood.
> > 
> > > 
> > > It is hard to say, which solution is better. It will affect performance
> > > and stability. We will need lots of testing on different HW variants to
> > > know it.
> > > May be usb maeling list can give some input here?
> > Let's hope so :)
> > 
> > > 
> > > Currently we have fallowing issues:
> > > - if EP4 and EP3 are Interrupt, it works slower on High Speed controller.
> > > - if EP4 and EP3 are Bulk, the work better on High Speed and brake on
> > > Super Speed controllers. This adapter support my 64B packets and if we
> > > have more, fifo of this adapter will overrun.
> > > - Full Speed is currently unknown field for me, and it looks like it was
> > > never actually working properly.
> > But given that dongle seem to work fine with muted warning do you think it's
> > fine to continue that way or not?
> > 
> > I mean if there's a chance this "bogus usb xfer" might affect something during
> > execution? Otherwise if that's just not a crucial problem or not a problem at all
> > may be we may just think how to make this warning not so annoying (in my case
> > I saw never ending flood of those warnings so that basically stopped me from using
> > the board after that warning started to appear.
>
> I'll answer with an example:
> on USB3 hw this warning was ignore and caused hard reproducible bug
> which cost me some week to debug. The result was a FIFO overflow on
> adapter side.

Yeah that makes a perfect sense then.
Let's see if there're any other suggestions on the topic.

-Alexey
