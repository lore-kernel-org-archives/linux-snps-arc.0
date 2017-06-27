From: zackw@panix.com (Zack Weinberg)
Date: Tue, 27 Jun 2017 12:53:56 -0400
Subject: [RFC 2/6] ARC: Fixed inline asm contraints to gcc 6.x
In-Reply-To: <42b1e1e9-6c29-4ee8-3fc7-ab220e217908@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271146120.17677@digraph.polyomino.org.uk>
 <42b1e1e9-6c29-4ee8-3fc7-ab220e217908@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKCAbMj-ck4qkuOaAbFHvFGWVWO-F2Knqj6rzTwsjib9QaVqhg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Jun 27, 2017 at 12:40 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 06/27/2017 02:47 PM, Joseph Myers wrote:
>>
>> longlong.h should be kept in sync with GCC.  If the GCC version has been
>> fixed we can copy the updated version verbatim from GCC.
>
>
> Indeed it is fixed in upstream gcc.
>
>         commit 608e1e3746f5242f0b0987ce64ca99969c33fb48
>         Author: claziss <claziss at 138bc75d-0d04-0410-961f-82ee72b054a4>
>         Date:   Fri Apr 29 10:11:25 2016 +0000
>
>             [ARC] Fix obsolete constrain
>
> So I drop this patch from my series and rely on glibc upstream to have this
> fixed ?

Don't drop the patch; replace it with a patch that copies the file
verbatim from the GCC source tree.

zw
