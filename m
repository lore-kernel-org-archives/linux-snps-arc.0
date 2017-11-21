From: schwab@linux-m68k.org (Andreas Schwab)
Date: Tue, 21 Nov 2017 23:03:36 +0100
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com> (Vineet
 Gupta's message of "Tue, 21 Nov 2017 13:25:51 -0800")
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <878tezguh3.fsf@linux-m68k.org>
To: linux-snps-arc@lists.infradead.org

On Nov 21 2017, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> make subdirs=nptl check fails as librt.so fails to link due to missing
> pthread symbols. The real librt built does have libpthread.so in its link
> cmd hence is fine, but not this librt.

Don't do that then.  If you want to take shortcuts you need to know what
you are doing.  Before running make check you should make all to have
everything up-to-date.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
