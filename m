From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 1 Jun 2017 14:19:14 +0000
Subject: git repo with Redpine changes
In-Reply-To: <CAEhWJFkqCWE1QLJCRvkQEo0YokfzcW1sVFitwY_Q+OUcMBYSGg@mail.gmail.com>
References: <1495008675.2606.72.camel@synopsys.com>
 <CAEhWJFkVe1C9jtxH9zeeMeJiAs86sJGOKSoqMku0qRqNAQujxg@mail.gmail.com>
 <1495560381.22203.29.camel@synopsys.com>
 <CAEhWJFkqCWE1QLJCRvkQEo0YokfzcW1sVFitwY_Q+OUcMBYSGg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496326752.28487.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Amit!

On Thu, 2017-06-01@19:24 +0530, amit karwar wrote:
> On Tue, May 23, 2017 at 10:56 PM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> 
> I have posted a firmware image for new firmware loading mechanism to
> community. There are some patches for SDIO specific driver
> enhancements and fixes. I am sending them in couple of days. With
> those patches you will be able to see wireless interface bring up,
> connection in open network and data path working.

May I have any reference to that post/image?

> > 
> > 
> > > 
> > > > 
> > > > rsi_91x: rsi_sdio_master_reg_read: AHB register read failed
> > > > rsi_91x: rsi_load_firmware: REGOUT read failed
> > > > rsi_91x: rsi_hal_device_init: Failed to load TA instructions
> > > > rsi_91x: rsi_probe: Failed in device init
> > > > rsi_91x: rsi_91x_deinit: Performing deinit os ops
> > > > rsi_91x: rsi_core_qos_processor: Queue number = 255
> > > > rsi_91x: rsi_core_qos_processor: No More Pkt
> > > > rsi_91x: rsi_probe: Failed in probe...Exiting
> > > > RSI-SDIO WLAN: probe of mmc0:fffd:1 failed with error 1
> > > > ----------------------->8--------------------
> > > > 
> > > > ?2) In case of USB I just see:
> > > > ----------------------->8--------------------
> > > > usb 1-1: new high-speed USB device number 6 using ehci-platform
> > > > usb 1-1: config 1 interface 0 altsetting 0 endpoint 0x83 has an invalid bInterval 255, changing to 11
> > > > usb 1-1: New USB device found, idVendor=1618, idProduct=9113
> > > > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > usb 1-1: Product: Wireless USB-CDC Network Module
> > > > usb 1-1: Manufacturer: Redpine Signals, Inc.
> > > > cdc_acm 1-1:1.0: ttyACM0: USB ACM device
> > > > ----------------------->8--------------------
> > > > 
> > > > I noticed that there're quite some patches floating on linux-wireless mailing list which
> > > > were not yet merged in upstream kernel (even in linux-next or wireless-testing).
> > > > 
> > > > So at this point I'm not really sure what could be a safe baseline for my experiments:
> > > > ?- if existing vanilla say 4.11 kernel is good enough and things that doesn't work are caused
> > > > ???by other problems not related to Redpine module (that would be strange because both USB abd SD-card
> > > > ???slot are proven to work pretty well with other devices)
> > > > ?- if I need an arbitrary set of patches to get things up and running etc
> > > > 
> > > > That said if there's a public git repo which contains everything required for Redpine module to
> > > > work [preferably based on the latest kernel sources] I'd like to get a reference to it.
> > > > 
> > > > Any hints here are much appreciated.
> > > 
> > > We don't have a public git repo maintained. We have 2 patchsets ready
> > > for submission. We are working on code cleanup for other pending
> > > changes. I would suggest you to wait till these patches are posted.
> > 
> > Ok, will do. But please add me in Cc list in your upcoming patches as I'm very interested
> > in getting Redpine module working on our new board and will be happy to review them as well as test on
> > my platform.
> > 
> 
> Sure. I will add you in CC for those patches.

Thanks a lot!
I\ll keep an eye on those changes once they appear.

-Alexey
