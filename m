From: fixed-term.Oleksij.Rempel@de.bosch.com (fixed-term.Oleksij.Rempel)
Date: Wed, 6 Jul 2016 10:24:21 +0200
Subject: ath9k-htc on OHCI -> bogus usb xfer
In-Reply-To: <1467790987.3086.15.camel@synopsys.com>
References: <1467721137.3144.81.camel@synopsys.com>
 <577BED2D.7070209@rempel-privat.de> <1467739821.3086.13.camel@synopsys.com>
 <577C041C.7080905@rempel-privat.de> <1467790987.3086.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <577CC035.1000404@de.bosch.com>
To: linux-snps-arc@lists.infradead.org



On 06.07.2016 09:44, Alexey Brodkin wrote:
> Hi Oleksij,
> 
> On Tue, 2016-07-05@21:01 +0200, Oleksij Rempel wrote:
>> Am 05.07.2016 um 19:31 schrieb Alexey Brodkin:
>>>
>>> Hi Oleksij,
>>>
>>> On Tue, 2016-07-05@19:23 +0200, Oleksij Rempel wrote:
>>>>
>>>> Hi,
>>>>
>>>> Am 05.07.2016 um 14:20 schrieb Alexey Brodkin:
>>>>>
>>>>>
>>>>> Hello,
>>>>>
>>>>> Looks like this is another manifestation of already seen problem with ath9k-htc
>>>>> and OHCI controller.
>>>>>
>>>>> I'm trying to get USB Wi-Fi dongle based on Atheros AR9271 to work with our
>>>>> development board (this is Synopsys AXS103) and seeing a picture very similar to
>>>>> what was discussed here http://thread.gmane.org/gmane.linux.usb.general/110847
>>>>>
>>>>> Below is what I see on insertion of the dongle.
>>>>> Note I have the most recent ath9k-htc firmware (see "ath9k_htc/htc_9271-1.4.0.fw"
>>>>> in the log below) and Linux kernel is 4.6.3 (latest stable as of today) but the same
>>>>> happens even on 4.4.
>>>>>
>>>>> Interesting enough if I simply remove or disable the warning like that
>>>>> ------------------------>8---------------------------
>>>>> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
>>>>> index 3d27477..a317e1e 100644
>>>>> --- a/drivers/usb/core/urb.c
>>>>> +++ b/drivers/usb/core/urb.c
>>>>> @@ -443,11 +443,6 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>>>>>          * cause problems in HCDs if they get it wrong.
>>>>>          */
>>>>>  
>>>>> -       /* Check that the pipe's type matches the endpoint's type */
>>>>> -       if (usb_pipetype(urb->pipe) != pipetypes[xfertype])
>>>>> -               dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
>>>>> -                       usb_pipetype(urb->pipe), pipetypes[xfertype]);
>>>>> -
>>>>>         /* Check against a simple/standard policy */
>>>>>         allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |
>>>>>                         URB_FREE_BUFFER);
>>>>> ------------------------>8---------------------------
>>>>> everything seem to work quite nice.
>>>>>
>>>>> Any thoughts are much appreciated.
>>>>>
>>>>> That's the log itself:
>>>>> ------------------------>8---------------------------
>>>>> usb 1-1: new full-speed USB device number 2 using ohci-platform
>>>>> usb 1-1: ath9k_htc: Firmware ath9k_htc/htc_9271-1.4.0.fw requested
>>>>> usb 1-1: ath9k_htc: Transferred FW: ath9k_htc/htc_9271-1.4.0.fw, size: 51008
>>>>> ------------[ cut here ]------------
>>>>> WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
>>>>> usb 1-1: BOGUS urb xfer, pipe 1 != type 3
>>>>> Modules linked in:
>>>>> CPU: 0 PID: 4 Comm: kworker/0:0 Not tainted 4.6.3 #10
>>>>> Workqueue: events request_firmware_work_func
>>>>>
>>>>> Stack Trace:
>>>>>   arc_unwind_core.constprop.1+0x94/0x10c
>>>>> ---[ end trace 2249b79eac9991d1 ]---
>>>>> ------------[ cut here ]------------
>>>>> WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
>>>>> usb 1-1: BOGUS urb xfer, pipe 1 != type 3
>>>>> Modules linked in:
>>>>> CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G        W       4.6.3 #10
>>>>> Workqueue: events request_firmware_work_func
>>>>>
>>>>> Stack Trace:
>>>>>   arc_unwind_core.constprop.1+0x94/0x10c
>>>>> ---[ end trace 2249b79eac9991d2 ]---
>>>>> ------------[ cut here ]------------
>>>>> WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
>>>>> usb 1-1: BOGUS urb xfer, pipe 1 != type 3
>>>>> Modules linked in:
>>>>> CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G        W       4.6.3 #10
>>>>> Workqueue: events request_firmware_work_func
>>>>>
>>>>> Stack Trace:
>>>>>   arc_unwind_core.constprop.1+0x94/0x10c
>>>>> ---[ end trace 2249b79eac9991d3 ]---
>>>>>
>>>> please send content of hif_usb_send_regout() from your source code.
>>>> It is located in drivers/net/wireless/ath/ath9k/hif_usb.c
>>> I use vanilla 4.6.3 tree so that's what I have is the same as
>>> http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/drivers/net/wireless/ath/ath9k/hif_usb.c?h=
>>> linu
>>> x-4.6.y#n99
>>
>> Interesting.
>> Can you please send lsusb -v for this adapter?
> 
> See below:
> -------------------------->8---------------------------
> # lsusb -v
> 
> Bus 002 Device 002: ID 0cf3:9271  
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          255 
>   bDeviceSubClass       255 
>   bDeviceProtocol       255 
>   bMaxPacketSize0        64
>   idVendor           0x0cf3 
>   idProduct          0x9271 
>   bcdDevice            1.08
>   iManufacturer          16 ATHEROS
>   iProduct               32 USB2.0 WLAN
>   iSerial                48 12345
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           60
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           6
>       bInterfaceClass       255 
>       bInterfaceSubClass      0 
>       bInterfaceProtocol      0 
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0

Hm... this Endpoint should be Interrupt, not Bulk. If you search for
lsusb of this kind of adapter all of them list EP3 and EP4 as Interrupt.

what did went wrong here? Is it not working in USB High Speed mode?
