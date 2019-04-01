From: mpe@ellerman.id.au (Michael Ellerman)
Date: Mon, 01 Apr 2019 22:08:30 +1100
Subject: [PATCH v2 2/5] powerpc: module_[32|64].c: replace swap function
 with built-in one
In-Reply-To: <14019281554057359@sas1-87f9feb8d943.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <14019281554057359@sas1-87f9feb8d943.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87v9zyoudt.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Andrey Abramov <st5pub at yandex.ru> writes:
> Replace relaswap with built-in one, because relaswap
> does a simple byte to byte swap.

I replied to v1 with an ack, which stands, this is just a clarification.

> Since Spectre mitigations have made indirect function calls more
> expensive, and the default simple byte copies swap is implemented
> without them, an "optimized" custom swap function is now
> a waste of time as well as code.

Spectre mitigations don't necessarily slow down indirect function calls
on all arches or in all configurations on all arches, so that
justification is a bit dubious.

That's not really a problem for this patch, because the existing
overhead of the function call is probably already enough to rival the
cost of the 24 byte copy.

cheers
