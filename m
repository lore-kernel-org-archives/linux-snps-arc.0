From: nbd@openwrt.org (Felix Fietkau)
Date: Sat, 16 Jan 2016 15:12:49 +0100
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <87si1xwzys.fsf@dell.be.48ers.dk>
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org> <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
 <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
 <5699024C.5010300@openwrt.org> <87wpr9x161.fsf@dell.be.48ers.dk>
 <569A20D3.2080304@openwrt.org> <87si1xwzys.fsf@dell.be.48ers.dk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <569A4FE1.5000003@openwrt.org>
To: linux-snps-arc@lists.infradead.org

On 2016-01-16 12:00, Peter Korsgaard wrote:
>  >> We changed to devtmpfs by default in Buildroot quite some time ago, and
>  >> I'm pretty happy with it.
>  > We need to have dynamically created device nodes anyway - for managing
>  > permissions, being able to change names, etc. Because of that, devtmpfs
>  > is not enough to provide a full /dev. Since it's not enough, and
>  > creating the initial device nodes from our custom init is easy, we see
>  > little value in keeping it. So we got rid of the extra bloat :)
> 
> Heh, "bloat":
> 
> arm-none-eabi-size drivers/base/devtmpfs.o
>    text    data     bss     dec     hex filename
>    1568      64       4    1636     664 drivers/base/devtmpfs.o
> 
> Compared to the extra inodes and/or the busybox mknod applet + script,
> it isn't too bad.
I know it's not much, but we do like to disable anything that's
completely useless for our purposes. :)
Our code doesn't use busybox mknod. The stuff that creates the device
nodes is written in C.

> In Buildroot we support pure devtmpfs, mdev or udev (both with devtmpfs)
> or static /dev for legacy setups.
Yeah, for Buildroot devtmpfs makes sense. We don't use or support mdev,
udev or static /dev. We also got rid of hotplug2 a while back ;)

- Felix
