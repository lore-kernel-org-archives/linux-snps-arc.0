From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 25 Aug 2017 09:20:16 -0400
Subject: [PATCH] console: don't select first registered console if
 stdout-path used
In-Reply-To: <20170825131451.15944-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825131451.15944-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170825092016.66ef2fe0@gandalf.local.home>
To: linux-snps-arc@lists.infradead.org

On Fri, 25 Aug 2017 16:14:51 +0300
Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:

> In the current implementation we take the first console that
> registers if we didn't select one.
> 
> But if we specify console via "stdout-path" property in device tree
> we don't want first console that registers here to be selected.
> Otherwise we may choose wrong console - for example if some console
> is registered earlier than console is pointed in "stdout-path"
> property because console pointed in "stdout-path" property can be add as
> preferred quite late - when it's driver is probed.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  kernel/printk/printk.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 512f7c2..23262c1 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -26,6 +26,7 @@
>  #include <linux/nmi.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> +#include <linux/of.h>
>  #include <linux/delay.h>
>  #include <linux/smp.h>
>  #include <linux/security.h>
> @@ -2431,6 +2432,16 @@ void register_console(struct console *newcon)
>  	if (!has_preferred || bcon || !console_drivers)
>  		has_preferred = preferred_console >= 0;
>  
> +
> +	/*
> +	 * If we specify console via "stdout-path" property in device tree
> +	 * we don't want first console that registers here to be selected.
> +	 */
> +#ifdef CONFIG_OF
> +	if (of_stdout)
> +		has_preferred = true;
> +#endif

To remove the #ifdef from the code, could the of.h move

#ifdef CONFIG_OF

Above the extern declarations of of_stdout and friends, and then have:

#else /* !CONFIG_OF */

#define of_stdout	NULL

#endif

Then we could just have:

	if (of_stdout)
		has_preferred = true;

without the ifdefs.

-- Steve

> +
>  	/*
>  	 *	See if we want to use this console driver. If we
>  	 *	didn't select a console we take the first one
