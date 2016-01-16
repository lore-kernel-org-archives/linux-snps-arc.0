From: nbd@openwrt.org (Felix Fietkau)
Date: Sat, 16 Jan 2016 11:52:03 +0100
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <87wpr9x161.fsf@dell.be.48ers.dk>
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org> <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
 <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
 <5699024C.5010300@openwrt.org> <87wpr9x161.fsf@dell.be.48ers.dk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <569A20D3.2080304@openwrt.org>
To: linux-snps-arc@lists.infradead.org

On 2016-01-16 11:35, Peter Korsgaard wrote:
>>>>>> "Felix" == Felix Fietkau <nbd at openwrt.org> writes:
> 
>  >>> OpenWrt works just fine without DEVTMPFS - doesn't matter if initramfs
>  >>> is enabled or not.
>  >> 
>  >> The discussion is about adding a patch to up upstream ARC kernel, not specific to
>  >> openwrt.
>  > Right. I belive that the upstream kernel should not arbitrarily force
>  > DEVTMPFS support for some architectures, as long as there are user space
>  > implementations (such as OpenWrt) that can do without it.
> 
> Agreed, only the options absolutely needed should be forced on.
> 
>  >> BTW if openwrt builds for initramfs, it has to enable DEVTMPFS under the hood.
>  >> Perhaps there are dependencies in openwrt build system which take care of that
>  >> already - o/w it just won't work (assuming dynamic dev nodes).
>  > Incorrect. OpenWrt does not use DEVTMPFS, it does not even get compiled
>  > into the image. We would like to keep it that way.
>  > Our user space takes care of creating all required device nodes very
>  > early during boot.
> 
> Out of interest, why is that? Devtmpfs got added 7 years ago (2.6.32) -
> And is easy to backport if really needed, is easier and more flexible
> than a bunch of static mknods, and probably smaller as well.
We don't need to backport anything. Our oldest kernel is 3.18, and we're
going to move everything to 4.4 soon ;)

> We changed to devtmpfs by default in Buildroot quite some time ago, and
> I'm pretty happy with it.
We need to have dynamically created device nodes anyway - for managing
permissions, being able to change names, etc. Because of that, devtmpfs
is not enough to provide a full /dev. Since it's not enough, and
creating the initial device nodes from our custom init is easy, we see
little value in keeping it. So we got rid of the extra bloat :)

- Felix
