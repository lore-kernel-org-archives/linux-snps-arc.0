From: schwab@linux-m68k.org (Andreas Schwab)
Date: Tue, 21 Nov 2017 23:29:25 +0100
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <97f30016-ab6d-46aa-030b-4f69c7aa4892@synopsys.com> (Vineet
 Gupta's message of "Tue, 21 Nov 2017 14:08:03 -0800")
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
 <878tezguh3.fsf@linux-m68k.org>
 <97f30016-ab6d-46aa-030b-4f69c7aa4892@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <874lpngta2.fsf@linux-m68k.org>
To: linux-snps-arc@lists.infradead.org

On Nov 21 2017, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> The problem is not specific subdirs=nptl, it happens for vanilla make
> check too.

As I said, make all before make check to have an up-to-date build.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
