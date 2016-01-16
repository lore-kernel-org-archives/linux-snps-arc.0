From: peter@korsgaard.com (Peter Korsgaard)
Date: Sat, 16 Jan 2016 11:35:02 +0100
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <5699024C.5010300@openwrt.org> (Felix Fietkau's message of "Fri,
 15 Jan 2016 15:29:32 +0100")
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org>
 <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
 <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
 <5699024C.5010300@openwrt.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87wpr9x161.fsf@dell.be.48ers.dk>
To: linux-snps-arc@lists.infradead.org

>>>>> "Felix" == Felix Fietkau <nbd at openwrt.org> writes:

 >>> OpenWrt works just fine without DEVTMPFS - doesn't matter if initramfs
 >>> is enabled or not.
 >> 
 >> The discussion is about adding a patch to up upstream ARC kernel, not specific to
 >> openwrt.
 > Right. I belive that the upstream kernel should not arbitrarily force
 > DEVTMPFS support for some architectures, as long as there are user space
 > implementations (such as OpenWrt) that can do without it.

Agreed, only the options absolutely needed should be forced on.

 >> BTW if openwrt builds for initramfs, it has to enable DEVTMPFS under the hood.
 >> Perhaps there are dependencies in openwrt build system which take care of that
 >> already - o/w it just won't work (assuming dynamic dev nodes).
 > Incorrect. OpenWrt does not use DEVTMPFS, it does not even get compiled
 > into the image. We would like to keep it that way.
 > Our user space takes care of creating all required device nodes very
 > early during boot.

Out of interest, why is that? Devtmpfs got added 7 years ago (2.6.32) -
And is easy to backport if really needed, is easier and more flexible
than a bunch of static mknods, and probably smaller as well.

We changed to devtmpfs by default in Buildroot quite some time ago, and
I'm pretty happy with it.

-- 
Venlig hilsen,
Peter Korsgaard 
