From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 21 Dec 2018 11:07:20 -0800
Subject: [PATCH 01/21] longlong.h: sync from gcc to fix ARC inline asm
 constraints
In-Reply-To: <alpine.DEB.2.21.1812211845320.10148@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812211845320.10148@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <364fb7e6-242e-eff9-7984-4801a51318cf@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/21/18 10:46 AM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> This corresponds to the version
>>
>> Author: law <law at 138bc75d-0d04-0410-961f-82ee72b054a4>
>> Date:   Tue Jun 27 16:10:15 2017 +0000
>>
>>         * longlong.h: Remove ns32k support.
> It seems odd to update from an out-of-date version of longlong.h, missing 
> the subsequent RISC-V changes. 

Sorry, that was way back when I started the port (not an excuse for sure).

> So I've committed this patch instead to 
> update to the current version in GCC.

Thx, a lot. I'll drop this from v2.

> Update longlong.h.
> 
> This patch updates longlong.h from GCC.  There were no local changes
> in glibc (the previous version was identical to the r232143 GCC
> version, apart from copyright dates which had been updated in both
> places), so this patch makes it identical to the version in GCC again.
> 
> Tested for x86_64 and x86.  Also tested with build-many-glibcs.py for
> its RISC-V configurations, as the glibc architecture with the most
> substantial changes in longlong.h in this patch.
> 
> 2018-12-21  Joseph Myers  <joseph at codesourcery.com>
> 
> 	* stdlib/longlong.h: Update from GCC.
