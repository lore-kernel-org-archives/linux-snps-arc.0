From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Sun, 31 Jul 2016 12:56:23 +0200
Subject: [uclibc-ng-devel] [PATCH 0/2] ARC Moving to @pcl relocations
In-Reply-To: <20160729132609.GO4517@embecosm.com>
References: <cover.1469729044.git.andrew.burgess@embecosm.com>
 <16492d6d-b4d4-39af-18dd-15f78c1abeff@synopsys.com>
 <A3C16EF4-41C6-4E69-B8E7-6B2DEC457064@gmail.com>
 <1e046cfd-bf55-c1fa-6083-6bd7acf0f705@synopsys.com>
 <1469782070.3088.10.camel@synopsys.com>
 <20160729094317.GM4517@embecosm.com>
 <20160729132609.GO4517@embecosm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160731105623.GR22524@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Andrew,
Andrew Burgess wrote,

> * Andrew Burgess <andrew.burgess at embecosm.com> [2016-07-29 10:43:17 +0100]:
> 
> > * Alexey Brodkin <Alexey.Brodkin at synopsys.com> [2016-07-29 08:49:22 +0000]:
> > 
> > > Hi Andrew, all,
> > > 
> > > On Thu, 2016-07-28@15:40 -0700, Vineet Gupta wrote:
> > > > On 07/28/2016 03:04 PM, Bernhard Reutner-Fischer wrote:
> > > > > 
> > > > > > 
> > > > > > Indeed your 2/2 seems to be the most "past-proof" code change. So I
> > > > > > > 
> > > > > > > would think it
> > > > > > > is indeed better and is something I should have done in the first
> > > > > > > place.
> > > > > > > 
> > > > > > > @Alexey, @Vlad what say you ?
> > > > > uClibc traditionally supports the current stable release of binutils, which would make it patch #1 I think.
> > > > > 
> > > > 
> > > > But 2/2 works for both and makes actual binutils version moot. FWIW, ARC tools
> > > > don't as of last release didn't use the upstream/stable binutils, but we are
> > > > pretty close to that now though.
> > > 
> > > Personally I'd prefer to not add more conditional defines in uClibc but
> > > make it a little-bit simpler.
> > > 
> > > I.e. either Vlad's patch or #1 from this series IMHO looks better.
> > > It's been quite some time since we updated our tools with PCL support
> > > and I'm not really sure if there's anybody interested in using ages old
> > > tools with today's uClibc. We don't test such combinations and there could
> > > be issues already in such combos.
> > > 
> > > BTW I noticed that Vlad's patch removes/reverts that thing as well:
> > > http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/ldso/ldso/arc/dl-sysdep.h?id=181d410ad00cddd1d6c9f4835e129136b74
> > > c5187
> > > 
> > > While Andrew just replaces ".&" construction with "@pcl".
> > > I'm wondering which is the correct approach here?
> > 
> > I left the second block in as the two blocks use different symbols,
> > the native threads block uses _DYNAMIC, while the non-native uses
> > _dl_start.
> > 
> > I wasn't sure if this was significant, so left the the split in
> > place.  If more knowledgeable folk believe these can be combined then
> > that's fine with me (so long as we combine on @pcl).
> 
> Having looked at this a little more I think that we should merge the
> section Alexey mentioned above.  In the second instance (the one I
> modified) we use the symbol _dl_start, while in the first we use
> _DYNAMIC.
> 
> However, the comment in the first block makes it clear the symbol used
> should be a global symbol, not a local, and _dl_start is a local
> symbol.
> 
> The consequence of using a local here is that we end up with a
> R_ARC_NONE relocation being generated again the .got.
> 
> [ The generation of the R_ARC_NONE is probably a bug, or at least a
>   lack of optimisation, but it is what happens with the current
>   upstream tools. ]
> 
> As the arc dynamic loader does not currently support patching
> R_ARC_NONE during the bootstrap phase, if uClibc(-ng) is configured
> without native threads, then currently we get a dynamic loader that
> does not work.
> 
> So, I think we should collapse both sections, and make use of the
> _DYNAMIC symbol instead of _dl_start.  I've included a revised version
> of patch 1/2 that includes this latest change.

Thanks, simplification is always good.
 Applied and pushed,
   Waldemar
