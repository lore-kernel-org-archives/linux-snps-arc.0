From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 19 Jul 2018 16:21:32 +0000
Subject: arch/arc/ allmodconfig
References: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC some folks from Mellanox

On 07/18/2018 10:37 PM, Randy Dunlap wrote:
> Hi,
>
> When I try to (cross-)build arch/arc/ allmodconfig, I get a syntax error here:
>
> ./arch/arc/plat-eznps/mtm.c: In function 'mtm_enable_core':
> ../arch/arc/plat-eznps/mtm.c:113:30: error: storage size of 'dpc' isn't known
>   struct nps_host_reg_aux_dpc dpc;
>                               ^~~
>
> There is no struct nps_host_reg_aux_dpc in the kernel tree.
>
> Can you do something about this, please?

Thx for the report Randy. I'm calling out Mellanox folks to see if they can
provide a fixup, else we will revert the corresponding change.

@Elad, upstream commit 3f9cd874dcc8705 "ARC: [plat-eznps] avoid toggling of DPC
register" added reference to struct nps_host_reg_aux_dpc but the definition is
missing. Can you please provide a fixup as I have no idea of that platform
specific struct.

@ Leon, reaching our to you, since it seems you removed Elad from MAINTAINERS
file, so I'm not sure if he is still at Mellanox.
The two folks I worked with on EZCHiip Linux port Noam Camus and Gilad have left
Mellanox.
If you or someone from Mellanox are interested in maintaining this platform,
please update the arch/arc/plat-eznps section of MAINTAINERS file.


Thx,
-Vineet
