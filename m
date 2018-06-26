From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 26 Jun 2018 10:01:30 -0700
Subject: [PATCH] arc: configs: remove no longer needed config option
In-Reply-To: <20180626152851.32674-1-anders.roxell@linaro.org>
References: <20180626152851.32674-1-anders.roxell@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f071a4af-5043-126d-fe3e-cff7deb974d1@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/26/2018 08:29 AM, Anders Roxell wrote:
> Since commit eedf265aa003 ("devpts: Make each mount of devpts an
> independent filesystem.") CONFIG_DEVPTS_MULTIPLE_INSTANCES isn't needed
> in the defconfig anymore.
>
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Thx,

Added to for-curr !

-Vineet
