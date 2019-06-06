From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 6 Jun 2019 14:24:23 -0700
Subject: state of uClibc ARC soft-float support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8544debf-dfb6-ebb5-a80e-aa9f860949ff@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

After test-suite commit 9f079b6353 "(disable complex math)" the math tests build
and I see lot of failures (for the default soft float builds)

	.... test-float-finiteFAIL test-float-finite got 1 expected 0
	.... test-floatFAIL test-float got 1 expected 0
	.... test-idoubleFAIL test-idouble got 1 expected 0
	.... test-ifloatFAIL test-ifloat got 1 expected 0
	.... test-matherrFAIL test-matherr got 1 expected 0
	.... test-nan-overflowFAIL test-nan-overflow got 1 expected 0
	.... test-nan-payloadFAIL test-nan-payload got 1 expected 0


Interestingly in ARC glibc port, soft float builds, all flaot tests pass (so
atleast gcc/libgcc foo seem to be fine I think).

I noticed a few things:

1. ulps for ARC was removed from test-sute last year - so I copied over the
version from ARC glibc port [1]

2. I suppose these don't depend on UCLIBC_HAS_FENV. Anyhow It seems uClibc
__UCLIBC_HAS_FENV__ implies hardware float as it expects all FE_*
exceptions/rounding modes to be defined in ARCH specific file.

Anyhow I tried creating an ARC specific fenv to support soft float with no
exceptions and only single rounding mode but that doesn't seem to help. Any idea
what I'm missing or if it is worth pursuing at all.

Thx,
-Vineet


[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-January/005347.html
