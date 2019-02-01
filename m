From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Feb 2019 23:36:59 +0000
Subject: [PATCH v2 2/5] ARCv2: introduce unaligned access under a
 Kconfig option
References: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
 <20190130163244.10870-3-Eugeniy.Paltsev@synopsys.com>
 <f95135f7-20e3-1897-d3dc-e8dadf8a2ac5@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642E698@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/1/19 3:28 PM, Vineet Gupta wrote:
> Guess there's no solution to this. We could force select the option in relevant
> Kconfig, but this applies to pretty much every platform and defeats the purpose of
> option in first place.

Answering my own question:

#if defined(__ARC_UNALIGNED__) && !defined(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS)
BUILD_BUG_ON_MSG(1, "gcc doesn't support disabling unaligned accesses");
#endif
