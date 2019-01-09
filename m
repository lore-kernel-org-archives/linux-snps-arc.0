From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 9 Jan 2019 09:35:23 -0800
Subject: [PATCH] ARC: show detaled ActionPoint configuration in mumbojumbo
In-Reply-To: <20181228164444.11241-1-Eugeniy.Paltsev@synopsys.com>
References: <20181228164444.11241-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <105ed98c-fdd0-3cbc-825f-f8cd0c782cce@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/28/18 8:44 AM, Eugeniy Paltsev wrote:
> Add information about ActionPointis number and supported set
> of targets (minimum / full).
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/include/asm/arcregs.h |  8 +++++++
>  arch/arc/kernel/setup.c        | 53 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index 49bfbd879caa..aa673e27add5 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -216,6 +216,14 @@ struct bcr_fp_arcv2 {
>  #endif
>  };
>  


> +
>  #include <soc/arc/timers.h>
>  
>  struct bcr_bpu_arcompact {
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index b2cae79a25d7..c8d67f9cd40d 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -115,6 +115,47 @@ static void read_decode_ccm_bcr(struct cpuinfo_arc *cpu)
>  	}
>  }
>  
> +static bool actionpoints_exists(void)
> +{
> +	struct bcr_actionpoint bcr;
> +
> +	READ_BCR(ARC_REG_AP_BCR, bcr);
> +	return !!bcr.ver;
> +}

Lets try to follow the existing coding convention of this file. I don't see much
value of this helper.

> +
> +static const char *actionpoints_configuration(void)
> +{
> +	struct bcr_actionpoint bcr;
> +
> +	READ_BCR(ARC_REG_AP_BCR, bcr);
> +	switch (bcr.type) {
> +	case 0x0:
> +		return "2, full";
> +	case 0x1:
> +		return "4, full";
> +	case 0x2:
> +		return "8, full";
> +	case 0x4:
> +		return "2, minimum";
> +	case 0x5:
> +		return "4, minimum";
> +	case 0x6:
> +		return "8, minimum";
> +
> +	default:
> +		return "unknown";
> +	}

This might sound pedantic, but this is adding 8 unique string to rodata. Again
following the convention we could fine grain the bcr into 2 bitfields: full, num
etc. And decode them just as we do for mmu/cache bcrs.

> +}
> +
> +static int actionpoints_mumbojumbo(char *buf, int len)
> +{
> +	if (!actionpoints_exists())
> +		return 0;
> +
> +	return scnprintf(buf, len, "ActionPoint (%s set)",
> +			 actionpoints_configuration());
> +}
> +
>  static void read_arc_build_cfg_regs(void)
>  {
>  	struct bcr_timer timer;
> @@ -206,8 +247,7 @@ static void read_arc_build_cfg_regs(void)
>  		}
>  	}
>  
> -	READ_BCR(ARC_REG_AP_BCR, bcr);
> -	cpu->extn.ap = bcr.ver ? 1 : 0;
> +	cpu->extn.ap = actionpoints_exists();
>  
>  	READ_BCR(ARC_REG_SMART_BCR, bcr);
>  	cpu->extn.smart = bcr.ver ? 1 : 0;
> @@ -332,12 +372,15 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
>  			       IS_AVAIL1(cpu->extn.fpu_sp, "SP "),
>  			       IS_AVAIL1(cpu->extn.fpu_dp, "DP "));
>  
> -	if (cpu->extn.debug)
> -		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s%s\n",
> -			       IS_AVAIL1(cpu->extn.ap, "ActionPoint "),
> +	if (cpu->extn.debug) {
> +		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s",
>  			       IS_AVAIL1(cpu->extn.smart, "smaRT "),
>  			       IS_AVAIL1(cpu->extn.rtt, "RTT "));
>  
> +		n += actionpoints_mumbojumbo(buf + n, len - n);
> +		n += scnprintf(buf + n, len - n, "\n");
> +	}
> +
>  	if (cpu->dccm.sz || cpu->iccm.sz)
>  		n += scnprintf(buf + n, len - n, "Extn [CCM]\t: DCCM @ %x, %d KB / ICCM: @ %x, %d KB\n",
>  			       cpu->dccm.base_addr, TO_KB(cpu->dccm.sz),
> 

How does below look like ?

------------->
diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 9f10d32ee1bd..f1b86cef0905 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -216,6 +216,14 @@ struct bcr_fp_arcv2 {
 #endif
 };

+struct bcr_actionpoint {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:21, min:1, num:2, ver:8;
+#else
+	unsigned int ver:8, num:2, min:1, pad:21;
+#endif
+};
+
 #include <soc/arc/timers.h>

 struct bcr_bpu_arcompact {
@@ -302,7 +310,7 @@ struct cpuinfo_arc {
 	struct {
 		unsigned int swap:1, norm:1, minmax:1, barrel:1, crc:1, swape:1, pad1:2,
 			     fpu_sp:1, fpu_dp:1, dual:1, dual_enb:1, pad2:4,
-			     debug:1, ap:1, smart:1, rtt:1, pad3:4,
+			     ap_num:4, ap_full:1, smart:1, rtt:1, pad3:1,
 			     timer0:1, timer1:1, rtc:1, gfrc:1, pad4:4;
 	} extn;
 	struct bcr_mpy extn_mpy;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 926e1bc1cd7f..b4c1db2811af 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -122,6 +122,7 @@ static void read_arc_build_cfg_regs(void)
 	struct cpuinfo_arc *cpu = &cpuinfo_arc700[smp_processor_id()];
 	const struct id_to_str *tbl;
 	struct bcr_isa_arcv2 isa;
+	struct bcr_actionpoint ap;

 	FIX_PTR(cpu);

@@ -207,8 +208,11 @@ static void read_arc_build_cfg_regs(void)
 		}
 	}

-	READ_BCR(ARC_REG_AP_BCR, bcr);
-	cpu->extn.ap = bcr.ver ? 1 : 0;
+	READ_BCR(ARC_REG_AP_BCR, ap);
+	if (ap.ver) {
+		cpu->extn.ap_num = 2 << ap.num;
+		cpu->extn.ap_full = !ap.min;
+	}

 	READ_BCR(ARC_REG_SMART_BCR, bcr);
 	cpu->extn.smart = bcr.ver ? 1 : 0;
@@ -216,8 +220,6 @@ static void read_arc_build_cfg_regs(void)
 	READ_BCR(ARC_REG_RTT_BCR, bcr);
 	cpu->extn.rtt = bcr.ver ? 1 : 0;

-	cpu->extn.debug = cpu->extn.ap | cpu->extn.smart | cpu->extn.rtt;
-
 	READ_BCR(ARC_REG_ISA_CFG_BCR, isa);

 	/* some hacks for lack of feature BCR info in old ARC700 cores */
@@ -336,11 +338,17 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 			       IS_AVAIL1(cpu->extn.fpu_sp, "SP "),
 			       IS_AVAIL1(cpu->extn.fpu_dp, "DP "));

-	if (cpu->extn.debug)
-		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s%s\n",
-			       IS_AVAIL1(cpu->extn.ap, "ActionPoint "),
+	if (cpu->extn.ap_num | cpu->extn.smart | cpu->extn.rtt) {
+		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s",
 			       IS_AVAIL1(cpu->extn.smart, "smaRT "),
 			       IS_AVAIL1(cpu->extn.rtt, "RTT "));
+		if (cpu->extn.ap_num) {
+			n += scnprintf(buf + n, len - n, "ActionPoint %d/%s",
+				       cpu->extn.ap_num,
+				       cpu->extn.ap_full ? "full":"min");
+		}
+		n += scnprintf(buf + n, len - n, "\n");
+	}

 	if (cpu->dccm.sz || cpu->iccm.sz)
 		n += scnprintf(buf + n, len - n, "Extn [CCM]\t: DCCM @ %x, %d
