From: schwab@suse.de (Andreas Schwab)
Date: Wed, 30 Jan 2019 09:28:59 +0100
Subject: [PATCH v2 05/15] ARC: Atomics and Locking primitives
In-Reply-To: <1548811555-24373-6-git-send-email-vgupta@synopsys.com> (Vineet
 Gupta's message of "Tue, 29 Jan 2019 17:25:45 -0800")
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <mvmpnse8s6s.fsf@suse.de>
To: linux-snps-arc@lists.infradead.org

On Jan 29 2019, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:

> +#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
> +#define __PTHREAD_MUTEX_USE_UNION          1

New ports should use the preferred values for these macros.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
