From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 9 Nov 2018 14:20:55 +0000
Subject: [PATCH 02/13] elf-em.h: add EM_ARC
In-Reply-To: <20181109031536.GB21511@altlinux.org>
References: <20181109031536.GB21511@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <662c91c2859af216fb7c16351d8136310afd05cd.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Dmitry,

On Fri, 2018-11-09@06:15 +0300, Dmitry V. Levin wrote:
> The uapi/linux/audit.h header is going to use EM_ARC in order
> to define AUDIT_ARCH_ARC which is needed to implement
> syscall_get_arch() which in turn is required to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> 
> The value for EM_ARC has been taken from
> https://urldefense.proofpoint.com/v2/url?u=http-3A__www.sco.com_developers_gabi_2012-2D12-2D31_ch4.eheader.html&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=Xh7PO9ZcwtbHwzwugwhu0NZypO9ObM5zMkXiQ2ja-QI&s=23pqjp37UXKSxQC0AFzqBjPquJdrh_4FjSW00FLRf4k&e=
> 
> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> ---
>  include/uapi/linux/elf-em.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> index ba3696e3d694..56ff3f9d9633 100644
> --- a/include/uapi/linux/elf-em.h
> +++ b/
> @@ -26,6 +26,7 @@
>  #define EM_ARM		40	/* ARM 32 bit */
>  #define EM_SH		42	/* SuperH */
>  #define EM_SPARCV9	43	/* SPARC v9 64-bit */
> +#define EM_ARC		45	/* Argonaut RISC Core */
>  #define EM_H8_300	46	/* Renesas H8/300 */
>  #define EM_IA_64	50	/* HP/Intel IA-64 */
>  #define EM_X86_64	62	/* AMD x86-64 */

I guess we need to add ARCv2 here as well like that:
------------------------>8-----------------------
diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index 31aa10178335..5c6c263d5c69 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -41,6 +41,7 @@
 #define EM_TILEPRO     188     /* Tilera TILEPro */
 #define EM_MICROBLAZE  189     /* Xilinx MicroBlaze */
 #define EM_TILEGX      191     /* Tilera TILE-Gx */
+#define EM_ARCV2       195     /* Synopsys ARCv2 ISA */
 #define EM_BPF         247     /* Linux BPF - in-kernel virtual machine */
 #define EM_FRV         0x5441  /* Fujitsu FR-V */
------------------------>8-----------------------

See https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=include/elf/common.h;hb=HEAD#l309
Note though that we're moving from EM_ARC_COMPACT2 to EM_ARCV2 name
so it matches real ISA name. This is what we use in Glibc port we're
upstreaming now.

-Alexey
