From: hauke@hauke-m.de (Hauke Mehrtens)
Date: Tue, 30 Jan 2018 00:12:48 +0100
Subject: [LEDE-DEV] [PATCH] archs38: bump kernel to 4.14.
In-Reply-To: <1517240144.833.2.camel@synopsys.com>
References: <20180123164848.33426-1-Evgeniy.Didin@synopsys.com>
 <826f0003-fb27-56a7-22c5-e41f12ff79a2@hauke-m.de>
 <1517240144.833.2.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5aa4ba0b-04fd-335e-4660-d38defd98fbf@hauke-m.de>
To: linux-snps-arc@lists.infradead.org

On 01/29/2018 04:35 PM, Evgeniy Didin wrote:
> Hello Hauke,
> 
> There are two patches, which solves problem with undefined "Abort":
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm
> it/?id=7c2c11b208be09c156573fc0076b7b3646e05219
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm
> it/?id=dc8635b78cd8669c37e230058d18c33af7451ab1
> 
> These patches are applied in Linux 4.15 ver.
> 
> I have placed these patches in target/linux/generic/backport-4.14 and
> build finished without errors.
>  
> I expect these patches will be backported in upstream 4.14 branch
> anytime soon. Until these patches are accepted should I add them with 
> separate patch or should I add them in patch-series with kernel version
> update for archs38?

Please create a separate patch which adds these to patches to
target/linux/generic/backport-4.14

I haven't seen them in the 4.14 stable queue:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/queue-4.14

You could write to the stable mailing list to get this backported to
stable kernel 4.14, see this for details:
https://github.com/torvalds/linux/blob/master/Documentation/process/stable-kernel-rules.rst

Hauke
