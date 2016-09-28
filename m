From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 28 Sep 2016 08:56:02 +0200
Subject: [PATCH] perf: remove orphan DEBUG_PERF_USE_VMALLOC
In-Reply-To: <d82fe247-2b8c-896d-e6ce-fb82e78f360e@synopsys.com>
References: <1474988036-22260-1-git-send-email-vgupta@synopsys.com>
 <20160927113727.55dc9dcf23880a63105da670@arm.com>
 <d82fe247-2b8c-896d-e6ce-fb82e78f360e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160928065602.GS2794@worktop>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 27, 2016@09:51:35AM -0700, Vineet Gupta wrote:
> On 09/27/2016 09:37 AM, Kim Phillips wrote:
> > On Tue, 27 Sep 2016 07:53:56 -0700
> > Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> > 
> >> > This doesn't seem to be used anywhere
> > I thought so too, until I got this response for an equivalent patch:
> > 
> > https://lkml.org/lkml/2016/8/31/53
> 
> So this is some sort of "developer shortcut" to quickly enable 2 options with one
> option. Purpose seems dubious to me ! It would still be possible to enable vmalloc
> backed mmap on x86 by simply enabling that option from Kconfig.

PERF_USE_VMALLOC is not a user selectable option. Also
DEBUG_PERF_USE_VMALLOC clearly indicates its a _DEBUG_ option. Heck,
even the help text says what its for.
