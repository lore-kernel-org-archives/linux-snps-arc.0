From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Jan 2019 09:40:35 -0800
Subject: [PATCH v2 05/15] ARC: Atomics and Locking primitives
In-Reply-To: <mvmpnse8s6s.fsf@suse.de>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
 <mvmpnse8s6s.fsf@suse.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b7766cd4-3055-3e3b-f49b-fe870fee2740@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/30/19 12:28 AM, Andreas Schwab wrote:
> On Jan 29 2019, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
> 
>> +#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
>> +#define __PTHREAD_MUTEX_USE_UNION          1
> New ports should use the preferred values for these macros.

OK, changed to 0 and 0 per commit 06be6368da16104 ("nptl: Define
__PTHREAD_MUTEX_{NUSERS_AFTER_KIND,USE_UNION}")

Thx,
-Vineet
