From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Jan 2019 13:35:20 -0800
Subject: [PATCH v2 05/15] ARC: Atomics and Locking primitives
In-Reply-To: <alpine.DEB.2.21.1901302103470.16754@digraph.polyomino.org.uk>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
 <mvmpnse8s6s.fsf@suse.de>
 <alpine.DEB.2.21.1901302103470.16754@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a310d906-a091-d487-cb82-44030db58730@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/30/19 1:04 PM, Joseph Myers wrote:
>>> +#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
>>> +#define __PTHREAD_MUTEX_USE_UNION          1
>> New ports should use the preferred values for these macros.
> This seems like something that could be a common issue for new ports, so 
> worth a mention at <https://sourceware.org/glibc/wiki/NewPorts> alongside 
> such things as using init_array and USE_ATOMIC_COMPILER_BUILTINS.

Updated wiki page !
