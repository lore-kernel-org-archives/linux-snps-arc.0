From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 13 Dec 2018 18:23:18 +0000
Subject: [PATCH] ARC: fix __ffs return value to avoid build warnings
References: <20181213154257.23033-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641F6E3@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/13/18 7:43 AM, Eugeniy Paltsev wrote:
> Change __ffs return value from 'int' to 'unsigned long' as it
> is done in other implementations (like asm-generic, x86, etc...)
> to avoid build-time warnings in places where type is strictly
> checked.
>
> As __ffs may return values in [0-31] interval changing return
> type to unsigned is valid.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Can you please paste a couple of lines of offending output !

-Vineet
