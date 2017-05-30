From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 30 May 2017 09:30:43 -0700
Subject: [PATCH] arc: Add "include chroot" for DT bindings
In-Reply-To: <1496150575-9273-1-git-send-email-abrodkin@synopsys.com>
References: <1496150575-9273-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <82af576a-939b-f8cc-5c52-3b4ffb389dcb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/30/2017 06:22 AM, Alexey Brodkin wrote:
> Basically this extends
> c58299aa8754 "kbuild: create an "include chroot" for DT bindings" for
> ARC where we extensively use Device Tree and there're good reasons
> to use DT bindings, especially if those are required.
> 
> Otherwise on attempt to compile .dts with something like:
> -------------------->8---------------------
>   #include <dt-bindings/net/ti-dp83867.h>
> -------------------->8---------------------
> 
> we inevitably see this compilation failure:
> -------------------->8---------------------
> arch/arc/boot/dts/hsdk.dts:16:40: fatal error: dt-bindings/net/ti-dp83867.h: No such file or directory
>   #include <dt-bindings/net/ti-dp83867.h>
>                                          ^
> compilation terminated.
> -------------------->8---------------------
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Stephen Warren <swarren at wwwdotorg.org>
> Cc: Rob Herring <robh+dt at kernel.org>
> ---
>   arch/arc/boot/dts/include/dt-bindings | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 120000 arch/arc/boot/dts/include/dt-bindings
> 
> diff --git a/arch/arc/boot/dts/include/dt-bindings b/arch/arc/boot/dts/include/dt-bindings
> new file mode 120000
> index 000000000000..08c00e4972fa
> --- /dev/null
> +++ b/arch/arc/boot/dts/include/dt-bindings
> @@ -0,0 +1 @@
> +../../../../../include/dt-bindings
> \ No newline at end of file


I'm OK with adding this to ARC, but won't it be nicer to have a generic include 
helper instead to avoid boilerplate addition in multiple places ?

-Vineet
