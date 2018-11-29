From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Nov 2018 12:55:10 +0000
Subject: [PATCH] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
References: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <09e6afb585a62b23e33297b1c0979703ca9fab8c.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Thu, 2018-11-29@12:42 +0000, Jose Abreu wrote:
> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
> This can lead to misfunction of some drivers as generic functions do a
> plain dereference of a pointer that can be unaligned.
> 
> Let's use {get/put}_unaligned() helper instead of plain dereference of
> pointer in order to fix this.
> 
> We do not implement readsq()/writesq() as we assume that only HS is a
> 64 Bit CPU and that it supports unaligned loads/stores.

Pls note that ARC HS is still only 32-bit core at least as of today.

-Alexey
