From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 13 Mar 2018 14:51:58 +0000
Subject: tst-atomic
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520952717.4993.18.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

I see in commit e65912f8b2a6 ("rework most tests to work as standalone package")
"tst-atomic" and "tst-atomic-long" were marked as disabled for all architectures
as opposed to previously (in times of test-suite being a part of uClibc) disabled
only for selected arches (IA64, MIPS and SPARC).

The only guess I have it was done due to inability to refer not-exported "atomic.h".
Is that correct? But anyways I'm looking at a possibility to revive those as they
might be of use especially in case of emulation of atomics.

Any thoughts on how that could be done?

-Alexey
