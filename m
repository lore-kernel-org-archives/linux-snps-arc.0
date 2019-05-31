From: David.Laight@ACULAB.COM (David Laight)
Date: Fri, 31 May 2019 09:41:17 +0000
Subject: single copy atomicity for double load/stores on 32-bit systems
In-Reply-To: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <895ec12746c246579aed5dd98ace6e38@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta
> Sent: 30 May 2019 19:23
...
> While it seems reasonable form hardware pov to not implement such atomicity by
> default it seems there's an additional burden on application writers. They could
> be happily using a lockless algorithm with just a shared flag between 2 threads
> w/o need for any explicit synchronization. But upgrade to a new compiler which
> aggressively "packs" struct rendering long long 32-bit aligned (vs. 64-bit before)
> causing the code to suddenly stop working. Is the onus on them to declare such
> memory as c11 atomic or some such.

A 'new' compiler can't suddenly change the alignment rules for structure elements.
The alignment rules will be part of the ABI.

More likely is that the structure itself is unexpectedly allocated on
an 8n+4 boundary due to code changes elsewhere.

It is also worth noting that for complete portability only writes to
'full words' can be assumed atomic.
Some old Alpha's did RMW cycles for byte writes.
(Although I suspect Linux doesn't support those any more.)

Even x86 can catch you out.
The bit operations will do wider RMW cycles than you expect.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
