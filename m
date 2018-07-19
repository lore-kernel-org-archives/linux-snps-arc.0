From: rdunlap@infradead.org (Randy Dunlap)
Date: Wed, 18 Jul 2018 22:37:25 -0700
Subject: arch/arc/ allmodconfig
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
To: linux-snps-arc@lists.infradead.org

Hi,

When I try to (cross-)build arch/arc/ allmodconfig, I get a syntax error here:

./arch/arc/plat-eznps/mtm.c: In function 'mtm_enable_core':
../arch/arc/plat-eznps/mtm.c:113:30: error: storage size of 'dpc' isn't known
  struct nps_host_reg_aux_dpc dpc;
                              ^~~

There is no struct nps_host_reg_aux_dpc in the kernel tree.

Can you do something about this, please?

thanks,
-- 
~Randy
