From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 28 Jun 2016 05:38:59 +0000
Subject: [PATCH] arc: warn only once if DW2_UNWIND is disabled
In-Reply-To: <5771FD80.1090906@synopsys.com>
References: <1466668839-28210-1-git-send-email-abrodkin@synopsys.com>
 <5771FD80.1090906@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467092276.3231.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2016-06-28@10:00 +0530, Vineet Gupta wrote:
> On Thursday 23 June 2016 01:30 PM, Alexey Brodkin wrote:
> > 
> > If CONFIG_ARC_DW2_UNWIND is disabled every time arc_unwind_core()
> > gets called following message gets printed in debug console:
> > ----------------->8---------------
> > CONFIG_ARC_DW2_UNWIND needs to be enabled
> > ----------------->8---------------
> > 
> > That message makes sense if user indeed wants to see a backtrace or
> > get nice function call-graphs in perf but what if user disabled
> > unwinder for the purpose? Why pollute his debug console?
> > 
> > So instead we'll warn user about possibly missing feature once and
> > let him decide if that was what he or she really wanted.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: stable at vger.kernel.org??[3.18+]
>
> Does this really need to be stable backport ?

I think it makes perfect sense for any kernel version because
it saves debug console from being polluted with messages which
most probably have no point (Ok I disabled unwinder in kernel config,
why then spam me with proposals to enable it)?

-Alexey
