From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Mon, 1 Apr 2019 13:28:06 +0300
Subject: [PATCH v2 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
In-Reply-To: <201904010956.x319u70q021113@sdf.org>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <23051461554058370@iva6-3ac3de5fcc31.qloud-c.yandex.net>
 <20190401093555.GD9224@smile.fi.intel.com>
 <201904010956.x319u70q021113@sdf.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190401102806.GE9224@smile.fi.intel.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Apr 01, 2019@09:56:07AM +0000, George Spelvin wrote:
> On Mon, 1 Apr 2019@12:35:55 +0300, Andy Shevchenko wrote:
> > Hmm... If (*swap)() is called recursively it means the change might increase
> > stack usage on 64-bit platforms.
> > 
> > Am I missing something?
> 
> Under what conceivable circumstance would someone write a recursive
> (*swap)() function?
> 
> You're technically right, but the precondition is more fantastical
> than "if the U.K.'s parliament get their shit together before the
> 12th", so I have a hard time worrying about it.
> 
> But you did make me think of something: the whole reason swap()
> takes a size argument is for the benefit of the (no longer existing)
> generic swap functions.  All of the custom swap functions ignore
> it.
> 
> So how about *deleting* the parameter instead?  That simplifies
> everything.

I like this idea!

-- 
With Best Regards,
Andy Shevchenko
