From: robh@kernel.org (Rob Herring)
Date: Thu, 3 Aug 2017 18:25:24 -0500
Subject: [PATCH 1/5] of: Add vendor prefix for Adaptrum, Inc.
In-Reply-To: <af822347-635d-a073-56e5-8eae403a729e@suse.de>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-2-alex.g@adaptrum.com>
 <af822347-635d-a073-56e5-8eae403a729e@suse.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170803232524.x7a7buzpkniaxg43@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Sat, Jul 29, 2017@04:48:28PM +0200, Andreas F?rber wrote:
> Hi Alexandru,
> 
> Am 29.07.2017 um 00:07 schrieb Alexandru Gagniuc:
> > Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Not sure why I'm CC'ed here, but it looks sane, so
> 
> Reviewed-by: Andreas F?rber <afaerber at suse.de>
> 
> If this patch gets respun, please add a sentence about your company to
> the commit message. I also think "dt-bindings:" is a more common prefix?

Please respin with the above and just send by itself. This can go 
separately as there's no need to merge via the same tree just in the 
name of satisfying checkpatch.

Rob
