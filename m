From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Sat, 30 Mar 2019 19:38:26 +0100
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
In-Reply-To: <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190330183826.GB21828@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Mar 30, 2019@07:43:53PM +0300, Andrey Abramov wrote:
> Replace int type with size_t type of the size argument
> in the swap function, also affect all its dependencies.

This says _what_ the patch does, but it gives no clue as to _why_ you
are doing this.  Neither did your 0/5 patch :(

Why make this change?  Nothing afterward depends on it from what I can
tell, so why is it needed?

thanks,

greg k-h
