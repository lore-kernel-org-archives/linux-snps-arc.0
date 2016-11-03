From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 23:46:50 +0100
Subject: [PATCH v2 01/10] ARC: timer: rtc: implement read loop in "C" vs.
 inline asm
In-Reply-To: <4ca3d740-dd75-fb4b-1967-aa3a605af62d@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
 <20161103215221.GM1859@mai>
 <952c1d98-2827-5127-2440-edab342e6b77@synopsys.com>
 <20161103223523.GB15759@mai>
 <4ca3d740-dd75-fb4b-1967-aa3a605af62d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103224650.GE15759@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@03:44:24PM -0700, Vineet Gupta wrote:
> On 11/03/2016 03:35 PM, Daniel Lezcano wrote:
> > On Thu, Nov 03, 2016@03:23:09PM -0700, Vineet Gupta wrote:
> >> On 11/03/2016 02:52 PM, Daniel Lezcano wrote:
> >>> On Thu, Nov 03, 2016@02:31:32PM -0700, Vineet Gupta wrote:
> >>>> The current code doesn't even compile ....
> >>>
> >>> Give a better description in the log, especially if this patch is supposed to
> >>> go to stable@
> >>
> >> OK.
> > 
> > [ ... ]
> 
> Here's what I added
> 
> ---->
>     ARC: timer: rtc: implement read loop in "C" vs. inline asm
> 
>     The current code doesn't even compile as somehow the inline assembly
>     can't see the register names defined as ARC_RTC_*
>     I'm pretty sure It worked when I first got it merged, but the tools were
>     definitely different then.
> 
>     So better to write this in "C" anyways.

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
