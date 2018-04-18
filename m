From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 18 Apr 2018 09:59:56 +0000
Subject: [PATCH] drm: Print unadorned pointers
In-Reply-To: <f5acc637-6743-f3ed-9328-f7b7177d4be6@linux.intel.com>
References: <20180418092450.13798-1-abrodkin@synopsys.com>
 <f5acc637-6743-f3ed-9328-f7b7177d4be6@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1524045595.3198.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2018-04-18@11:29 +0200, Maarten Lankhorst wrote:
> Op 18-04-18 om 11:24 schreef Alexey Brodkin:
> > After commit ad67b74 ("printk: hash addresses printed with %p")
> > pointers are being hashed when printed. However, this makes
> > debug output completely useless. Switch to %px in order to see the
> > unadorned kernel pointers.
> > 
> > This was done with the following one-liner:
> >  find drivers/gpu/drm -type f -name "*.c" -exec sed -r -i '/DRM_DEBUG|KERN_DEBUG|pr_debug/ s/%p\b/%px/g' {} +
> 
> So first we plug a kernel information leak hole, then we introduce it again? Seems like a terrible idea..

Well security concerns are good but what about us poor kernel developers?
Those debug prints are supposed to help us to deal with stuff we develop or fix.

Frankly I was quite surprised when first saw what was "unique hashed ID" instead
of real pointer value. And what's worse there's no way to get previous behavior back.
So now we have to manually patch sources here and there to get meaningful data, right?

I wouldn't bother sending this patch if there was Kconfig option reverting %p behavior
but that was never implemented.

-Alexey
