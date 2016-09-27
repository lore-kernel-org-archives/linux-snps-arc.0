From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Sep 2016 09:51:35 -0700
Subject: [PATCH] perf: remove orphan DEBUG_PERF_USE_VMALLOC
In-Reply-To: <20160927113727.55dc9dcf23880a63105da670@arm.com>
References: <1474988036-22260-1-git-send-email-vgupta@synopsys.com>
 <20160927113727.55dc9dcf23880a63105da670@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d82fe247-2b8c-896d-e6ce-fb82e78f360e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/27/2016 09:37 AM, Kim Phillips wrote:
> On Tue, 27 Sep 2016 07:53:56 -0700
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
>> > This doesn't seem to be used anywhere
> I thought so too, until I got this response for an equivalent patch:
> 
> https://lkml.org/lkml/2016/8/31/53

So this is some sort of "developer shortcut" to quickly enable 2 options with one
option. Purpose seems dubious to me ! It would still be possible to enable vmalloc
backed mmap on x86 by simply enabling that option from Kconfig.

-Vineet
