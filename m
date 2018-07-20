From: meirl@mellanox.com (Meir Lichtinger)
Date: Fri, 20 Jul 2018 07:19:07 +0000
Subject: arch/arc/ allmodconfig
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
References: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
 <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <AM0PR05MB42600653CF591791731CCCD8DA510@AM0PR05MB4260.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Ofer Levi is now the maintainer of arch/arc/plat-eznps

Ofer,
Please take care of the issue below

Thanks
 

-----Original Message-----
From: Vineet Gupta [mailto:Vineet.Gupta1@synopsys.com] 
Sent: Thursday, July 19, 2018 19:22
To: Randy Dunlap <rdunlap at infradead.org>; LKML <linux-kernel at vger.kernel.org>; Vineet Gupta <Vineet.Gupta1 at synopsys.com>; linux-snps-arc at lists.infradead.org
Cc: Elad Kanfi <eladkan at mellanox.com>; Leon Romanovsky <leonro at mellanox.com>
Subject: Re: arch/arc/ allmodconfig

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

Thx for the report Randy. I'm calling out Mellanox folks to see if they can provide a fixup, else we will revert the corresponding change.

@Elad, upstream commit 3f9cd874dcc8705 "ARC: [plat-eznps] avoid toggling of DPC register" added reference to struct nps_host_reg_aux_dpc but the definition is missing. Can you please provide a fixup as I have no idea of that platform specific struct.

@ Leon, reaching our to you, since it seems you removed Elad from MAINTAINERS file, so I'm not sure if he is still at Mellanox.
The two folks I worked with on EZCHiip Linux port Noam Camus and Gilad have left Mellanox.
If you or someone from Mellanox are interested in maintaining this platform, please update the arch/arc/plat-eznps section of MAINTAINERS file.


Thx,
-Vineet
