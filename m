From: joe@perches.com (Joe Perches)
Date: Tue, 20 Feb 2018 08:41:10 -0800
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <87vaesrxn0.fsf@concordia.ellerman.id.au>
References: <20180217211955.GE9640@amd>
 <187435d4-5017-edb5-9b6a-b433a148bfcc@c-s.fr>
 <20180219154135.GV22199@phenom.ffwll.local>
 <87vaesrxn0.fsf@concordia.ellerman.id.au>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1519144870.4326.7.camel@perches.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-02-20@17:19 +1100, Michael Ellerman wrote:
> Daniel Vetter <daniel at ffwll.ch> writes:
> > On Sun, Feb 18, 2018@11:00:56AM +0100, Christophe LEROY wrote:
> > > Le 17/02/2018 ? 22:19, Pavel Machek a ?crit :
> > > > 
> > > > Fix double ;;'s in code.
> > > > 
> > > > Signed-off-by: Pavel Machek <pavel at ucw.cz>
> > > 
> > > A summary of the files modified on top of the patch would help understand
> > > the impact.
> > > 
> > > A maybe there should be one patch by area, eg one for each arch specific
> > > modif and one for drivers/ and one for block/ ?
> > 
> > Yeah, pls split this into one patch per area, with a suitable patch
> > subject prefix. Look at git log of each file to get a feeling for what's
> > the standard in each area.
> 
> This part is actually pretty annoying.
> 
> I hacked up a script (below) which seems to do a reasonable job in most
> cases.

Here was another suggestion from awhile ago
https://lkml.org/lkml/2010/11/16/245
