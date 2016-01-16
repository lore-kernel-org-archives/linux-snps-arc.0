From: peter@korsgaard.com (Peter Korsgaard)
Date: Sat, 16 Jan 2016 12:00:59 +0100
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <569A20D3.2080304@openwrt.org> (Felix Fietkau's message of "Sat,
 16 Jan 2016 11:52:03 +0100")
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org>
 <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
 <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
 <5699024C.5010300@openwrt.org> <87wpr9x161.fsf@dell.be.48ers.dk>
 <569A20D3.2080304@openwrt.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87si1xwzys.fsf@dell.be.48ers.dk>
To: linux-snps-arc@lists.infradead.org

>>>>> "Felix" == Felix Fietkau <nbd at openwrt.org> writes:

Hi,

>> Out of interest, why is that? Devtmpfs got added 7 years ago (2.6.32) -
 >> And is easy to backport if really needed, is easier and more flexible
 >> than a bunch of static mknods, and probably smaller as well.
 > We don't need to backport anything. Our oldest kernel is 3.18, and we're
 > going to move everything to 4.4 soon ;)

Good!

 >> We changed to devtmpfs by default in Buildroot quite some time ago, and
 >> I'm pretty happy with it.
 > We need to have dynamically created device nodes anyway - for managing
 > permissions, being able to change names, etc. Because of that, devtmpfs
 > is not enough to provide a full /dev. Since it's not enough, and
 > creating the initial device nodes from our custom init is easy, we see
 > little value in keeping it. So we got rid of the extra bloat :)

Heh, "bloat":

arm-none-eabi-size drivers/base/devtmpfs.o
   text    data     bss     dec     hex filename
   1568      64       4    1636     664 drivers/base/devtmpfs.o

Compared to the extra inodes and/or the busybox mknod applet + script,
it isn't too bad.

In Buildroot we support pure devtmpfs, mdev or udev (both with devtmpfs)
or static /dev for legacy setups.

-- 
Venlig hilsen,
Peter Korsgaard 
