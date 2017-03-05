From: vgupta@synopsys.com (Vineet Gupta)
Date: Sat, 4 Mar 2017 16:07:24 -0800
Subject: [PATCH 0/3] ARC: get frequency via clock driver instead of
 reading device tree
In-Reply-To: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
References: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2e9840bb-fdf4-84c3-0520-695977a46c53@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/03/2017 03:29 AM, Vlad Zakharov wrote:
> This patch series replaces reading device tree with getting CPU
> clock frequency via clock driver in show_cpuinfo function.
> 
> In order to achieve this we also add cpu nodes to device tree which
> describes SMP system and add "clocks" properties to all ARC cpu nodes. 

Series seems sane to me - will give it a spin next week before adding for 4.11

Thx,
-Vieet


> Vlad Zakharov (3):
>   ARC: [dts] add input clocks for cpu nodes
>   ARC: [dts] add cpu nodes to ARCHS SMP device tree
>   arc: get rate from clk driver instead of reading device tree
> 
>  arch/arc/boot/dts/skeleton.dtsi        |  1 +
>  arch/arc/boot/dts/skeleton_hs.dtsi     |  1 +
>  arch/arc/boot/dts/skeleton_hs_idu.dtsi | 21 ++++++++++++++++++++-
>  arch/arc/kernel/setup.c                | 17 +++++++++++++----
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 
