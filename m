From: schwab@suse.de (Andreas Schwab)
Date: Mon, 04 Feb 2019 11:02:51 +0100
Subject: Need for arch pthread-offsets.h (was Re: [PATCH v2 05/15] ARC:
 Atomics and Locking primitives)
In-Reply-To: <8e025bb4-d86d-ba54-f937-3ae73870a71f@synopsys.com> (Vineet
 Gupta's message of "Thu, 31 Jan 2019 17:57:20 -0800")
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
 <mvmpnse8s6s.fsf@suse.de>
 <b7766cd4-3055-3e3b-f49b-fe870fee2740@synopsys.com>
 <8e025bb4-d86d-ba54-f937-3ae73870a71f@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <mvmva1z7tx0.fsf@suse.de>
To: linux-snps-arc@lists.infradead.org

On Jan 31 2019, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:

> However what was not obvious is adjustment to
> sysdeps/<arch>/nptl/pthread-offsets.h to __PTHREAD_MUTEX_*_OFFSET. But these don't
> seem to be *actually* used anywhere. Sure there are assert checks in
> pthread_mutext_init.c but what's the point: the struct is generic anyways. IOW I'm
> not sure what port specific errors/inconsistency they are catching, other than the
> fact that they need to be hand calculating when starting a new port.
>
> Am I missing something ?

The _OFFSET macros are for ensuring binary compatibility.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
