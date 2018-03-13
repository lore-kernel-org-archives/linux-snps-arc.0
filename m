From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Tue, 13 Mar 2018 20:55:15 +0100
Subject: tst-atomic
In-Reply-To: <1520952717.4993.18.camel@synopsys.com>
References: <1520952717.4993.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180313195515.GK2114@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,
Alexey Brodkin wrote,

> Hi Waldemar,
> 
> I see in commit e65912f8b2a6 ("rework most tests to work as standalone package")
> "tst-atomic" and "tst-atomic-long" were marked as disabled for all architectures
> as opposed to previously (in times of test-suite being a part of uClibc) disabled
> only for selected arches (IA64, MIPS and SPARC).
> 
> The only guess I have it was done due to inability to refer not-exported "atomic.h".
> Is that correct? But anyways I'm looking at a possibility to revive those as they
> might be of use especially in case of emulation of atomics.
> 
> Any thoughts on how that could be done?

Should we export atomic.h again?
The header is removed since
536a0e3a05a0c7d9a4d741d9401c220900cf1e04.

See
https://www.mail-archive.com/uclibc at uclibc.org/msg09694.html

What other solution we could imagine?

best regards
 Waldemar
