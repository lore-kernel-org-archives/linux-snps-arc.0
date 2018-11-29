From: David.Laight@ACULAB.COM (David Laight)
Date: Thu, 29 Nov 2018 12:47:59 +0000
Subject: [PATCH] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
References: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f634eb3e39284e48923552a0c21562c6@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Jose Abreu
> Sent: 29 November 2018 12:42
> 
> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
> This can lead to misfunction of some drivers as generic functions do a
> plain dereference of a pointer that can be unaligned.
> 
> Let's use {get/put}_unaligned() helper instead of plain dereference of
> pointer in order to fix this.

Is it worth adding a check for the pointer being aligned?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
