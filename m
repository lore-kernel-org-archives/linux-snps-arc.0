From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Mon, 29 Jan 2018 15:35:44 +0000
Subject: [LEDE-DEV] [PATCH] archs38: bump kernel to 4.14.
In-Reply-To: <826f0003-fb27-56a7-22c5-e41f12ff79a2@hauke-m.de>
References: <20180123164848.33426-1-Evgeniy.Didin@synopsys.com>
 <826f0003-fb27-56a7-22c5-e41f12ff79a2@hauke-m.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1517240144.833.2.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Hauke,

There are two patches, which solves problem with undefined "Abort":
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm
it/?id=7c2c11b208be09c156573fc0076b7b3646e05219
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm
it/?id=dc8635b78cd8669c37e230058d18c33af7451ab1

These patches are applied in Linux 4.15 ver.

I have placed these patches in target/linux/generic/backport-4.14 and
build finished without errors.
 
I expect these patches will be backported in upstream 4.14 branch
anytime soon. Until these patches are accepted should I add them with 
separate patch or should I add them in patch-series with kernel version
update for archs38?

Best regards,
Evgeniy Didin
