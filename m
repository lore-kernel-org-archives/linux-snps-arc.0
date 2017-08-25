From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 25 Aug 2017 11:25:41 -0400
Subject: [PATCH] OF: move extern declarations of entry pointers inside
 ifdef
In-Reply-To: <1503674411.15555.5.camel@synopsys.com>
References: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
 <20170825111200.5f0891a5@gandalf.local.home>
 <1503674411.15555.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170825112541.681dafd2@gandalf.local.home>
To: linux-snps-arc@lists.infradead.org

On Fri, 25 Aug 2017 15:20:12 +0000
Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:

> On Fri, 2017-08-25@11:12 -0400, Steven Rostedt wrote:
> > On Fri, 25 Aug 2017 18:00:26 +0300
> > Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:
> >   
> > > Move extern declarations of "of_root", "of_chosen", "of_aliases",
> > > "of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
> > > of "CONFIG_OF" ifdef in their usage places.
> > > 
> > > Suggested-by: Steven Rostedt <rostedt at goodmis.org>  
> > 
> > Thanks!
> > -- Steve  
> 
> Could you please ACK my patch if it looks good for you?
> Thanks.

I could, but ACKs are usually for the maintainer of the code being
changed. I don't maintain include/linux/of.h

But for what it's worth...

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

-- Steve
