From: David.Laight@ACULAB.COM (David Laight)
Date: Tue, 14 Mar 2017 10:18:03 +0000
Subject: [RFC PATCH 07/13] kernel/fork: Split and export 'mm_alloc' and
 'mm_init'
In-Reply-To: <20170313221415.9375-8-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
 <20170313221415.9375-8-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DCFFB03F4@AcuExch.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Linuxppc-dev Till Smejkal
> Sent: 13 March 2017 22:14
> The only way until now to create a new memory map was via the exported
> function 'mm_alloc'. Unfortunately, this function not only allocates a new
> memory map, but also completely initializes it. However, with the
> introduction of first class virtual address spaces, some initialization
> steps done in 'mm_alloc' are not applicable to the memory maps needed for
> this feature and hence would lead to errors in the kernel code.
> 
> Instead of introducing a new function that can allocate and initialize
> memory maps for first class virtual address spaces and potentially
> duplicate some code, I decided to split the mm_alloc function as well as
> the 'mm_init' function that it uses.
> 
> Now there are four functions exported instead of only one. The new
> 'mm_alloc' function only allocates a new mm_struct and zeros it out. If one
> want to have the old behavior of mm_alloc one can use the newly introduced
> function 'mm_alloc_and_setup' which not only allocates a new mm_struct but
> also fully initializes it.
...

That looks like bugs waiting to happen.
You need unchanged code to fail to compile.

	David
