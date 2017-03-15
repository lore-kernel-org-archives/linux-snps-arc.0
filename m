From: willy@infradead.org (Matthew Wilcox)
Date: Wed, 15 Mar 2017 09:57:36 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <CALCETrX5gv+zdhOYro4-u3wGWjVCab28DFHPSm5=BVG_hKxy3A@mail.gmail.com>
References: <CALCETrXKvNWv1OtoSo_HWf5ZHSvyGS1NsuQod6Zt+tEg3MT5Sg@mail.gmail.com>
 <20170314161229.tl6hsmian2gdep47@arch-dev>
 <CALCETrX5gv+zdhOYro4-u3wGWjVCab28DFHPSm5=BVG_hKxy3A@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170315165736.GE4033@bombadil.infradead.org>
To: linux-snps-arc@lists.infradead.org

On Wed, Mar 15, 2017@09:51:31AM -0700, Andy Lutomirski wrote:
> > VAS segments on the other side allow sharing of pure in memory data by
> > arbitrary related tasks without the need of a file. This becomes especially
> > interesting if one combines VAS segments with non-volatile memory since one can keep
> > data structures in the NVM and still be able to share them between multiple tasks.
> 
> What's wrong with regular mmap?

I think it's the usual misunderstandings about how to use mmap.
>From the paper:

   Memory-centric computing demands careful organization of the
   virtual address space, but interfaces such as mmap only give limited
   control. Some systems do not support creation of address regions at
   specific offsets. In Linux, for example, mmap does not safely abort if
   a request is made to open a region of memory over an existing region;
   it simply writes over it.

The correct answer of course, is "Don't specify MAP_FIXED".  Specify the
'hint' address, and if you don't get it, either fix up your data structure
pointers, or just abort and complain noisily.
