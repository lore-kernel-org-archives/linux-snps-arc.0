From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 25 Aug 2017 15:20:12 +0000
Subject: [PATCH] OF: move extern declarations of entry pointers inside
 ifdef
In-Reply-To: <20170825111200.5f0891a5@gandalf.local.home>
References: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
 <20170825111200.5f0891a5@gandalf.local.home>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503674411.15555.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2017-08-25@11:12 -0400, Steven Rostedt wrote:
> On Fri, 25 Aug 2017 18:00:26 +0300
> Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:
> 
> > Move extern declarations of "of_root", "of_chosen", "of_aliases",
> > "of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
> > of "CONFIG_OF" ifdef in their usage places.
> > 
> > Suggested-by: Steven Rostedt <rostedt at goodmis.org>
> 
> Thanks!
> -- Steve

Could you please ACK my patch if it looks good for you?
Thanks.

> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
-- 
?Eugeniy Paltsev
