From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 1 Jul 2017 13:47:44 +0300
Subject: [PATCH] ARC: Fix wrong access to "sp" member in user_regs_struct
In-Reply-To: <20170630131414.32627-1-Eugeniy.Paltsev@synopsys.com>
References: <20170630131414.32627-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170701104743.GB9546@altlinux.org>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 30, 2017@04:14:14PM +0300, Eugeniy Paltsev wrote:
> "sp" register is member of "scratch" structure (which is nested
> in user_regs_struct)
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  linux/arc/arch_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/arc/arch_regs.c b/linux/arc/arch_regs.c
> index 9a5c2df..88bb799 100644
> --- a/linux/arc/arch_regs.c
> +++ b/linux/arc/arch_regs.c
> @@ -1,4 +1,4 @@
>  static struct user_regs_struct arc_regs;
> -unsigned long *const arc_sp_ptr = &arc_regs.sp;
> +unsigned long *const arc_sp_ptr = &arc_regs.scratch.sp;
>  #define ARCH_REGS_FOR_GETREGSET arc_regs
>  #define ARCH_PC_REG arc_regs.efa

Applied, thanks.


-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20170701/15bef5c5/attachment.sig>
