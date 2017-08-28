From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 28 Aug 2017 12:41:59 +0000
Subject: [PATCH] console: don't select first registered console if
 stdout-path used
In-Reply-To: <20170825174448.GC5535@tigerII.localdomain>
References: <20170825131451.15944-1-Eugeniy.Paltsev@synopsys.com>
 <20170825174448.GC5535@tigerII.localdomain>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503924118.15555.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sat, 2017-08-26@02:44 +0900, Sergey Senozhatsky wrote:
> On (08/25/17 16:14), Eugeniy Paltsev wrote:
> > In the current implementation we take the first console that
> > registers if we didn't select one.
> > 
> > But if we specify console via "stdout-path" property in device tree
> > we don't want first console that registers here to be selected.
> > Otherwise we may choose wrong console - for example if some console
> > is registered earlier than console is pointed in "stdout-path"
> > property because console pointed in "stdout-path" property can be
> > add as
> > preferred quite late - when it's driver is probed.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> hm... this is not the first time we see DT and stdout-path.
> and so far it was pretty painful :) e.g. commits c6c7d83b9c9e,
> 05fd007e4629.
> 
> 	-ss

Hm... looks like I had to update my patch to keep existing tty0
behavior.

Before this patch tty0 was registered even if it was specified neither
in "bootargs" nor in "stdout-path".?
So I should retain this behavior as a lot of ARM boards (and some
powerpc) rely on it.

> 
> > ---
> > ?kernel/printk/printk.c | 11 +++++++++++
> > ?1 file changed, 11 insertions(+)
> > 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 512f7c2..23262c1 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -26,6 +26,7 @@
> > ?#include <linux/nmi.h>
> > ?#include <linux/module.h>
> > ?#include <linux/moduleparam.h>
> > +#include <linux/of.h>
> > ?#include <linux/delay.h>
> > ?#include <linux/smp.h>
> > ?#include <linux/security.h>
> > @@ -2431,6 +2432,16 @@ void register_console(struct console
> > *newcon)
> > ?	if (!has_preferred || bcon || !console_drivers)
> > ?		has_preferred = preferred_console >= 0;
> > ?
> > +
> > +	/*
> > +	?* If we specify console via "stdout-path" property in
> > device tree
> > +	?* we don't want first console that registers here to be
> > selected.
> > +	?*/
> > +#ifdef CONFIG_OF
> > +	if (of_stdout)
> > +		has_preferred = true;
> > +#endif
> > +
> > ?	/*
> > ?	?*	See if we want to use this console driver. If we
> > ?	?*	didn't select a console we take the first one
> > --?
> > 2.9.3
> > 
-- 
?Eugeniy Paltsev
