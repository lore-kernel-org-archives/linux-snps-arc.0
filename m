From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Sat, 10 Sep 2016 14:05:34 +0200
Subject: [PATCH] ARC: Fix max ULP for cosine test
In-Reply-To: <1471945278-18247-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1471945278-18247-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160910120534.GD6777@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,
Eugeniy Paltsev wrote,

> Max ULP for "cos (M_PI_6l * 2.0) == 0.5" in "test-double" sub-test
> is set to "0" for ARC. It causes "test-double" test failure.
> 
> I realized that this sub-test on ARM gets completely same results.
> But it doesn't fails on ARM because max ULP is set to "1" for ARM.
> 
> I am wondering, if it was done for any special reason?
> 
> Otherwise, set max ULP for "cos (M_PI_6l * 2.0) == 0.5" test to
> "1" instead of "0" for ARC.

Thanks applied and pushed. Normally I autogenerate the ULPS files
with tst-float -u .. and then merging with the perl script.

best regards
 Waldemar
