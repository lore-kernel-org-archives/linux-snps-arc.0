From: greg@kroah.com (Greg KH)
Date: Wed, 3 Aug 2016 07:42:01 +0200
Subject: ARC stable backport request
In-Reply-To: <7d6272e2-88db-193c-3902-a859d2fde820@suse.cz>
References: <57458FE3.1070205@synopsys.com> <20160802070058.GB10877@kroah.com>
 <7d6272e2-88db-193c-3902-a859d2fde820@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160803054201.GA6711@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Aug 02, 2016@09:45:56AM +0200, Jiri Slaby wrote:
> On 08/02/2016, 09:00 AM, Greg KH wrote:
> > On Wed, May 25, 2016@05:13:31PM +0530, Vineet Gupta wrote:
> >> Hi,
> >>
> >> Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
> >> Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
> >> which added this fix.
> > 
> > Didn't apply to 3.14-stable :(
> 
> I have a backport in 3.12. There was a conflict in comments. Could you
> try that?
> 
> commit fa5d506592a759b7848a59d1d5a025af8c9a7a6c
> Author: Vineet Gupta <vgupta at synopsys.com>
> Date:   Thu Nov 5 09:13:31 2015 +0530
> 
>     ARC: use ASL assembler mnemonic
> 
>     commit a6416f57ce57fb390b6ee30b12c01c29032a26af upstream.
> 
>     ARCompact and ARCv2 only have ASL, while binutils used to support LSL as
>     a alias mnemonic.
> 
>     Newer binutils (upstream) don't want to do that so replace it.
> 
>     Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>     Signed-off-by: Jiri Slaby <jslaby at suse.cz>

Ah, that worked, thanks, now applied.

greg k-h
