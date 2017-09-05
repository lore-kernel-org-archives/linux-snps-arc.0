From: pmladek@suse.com (Petr Mladek)
Date: Tue, 5 Sep 2017 16:54:05 +0200
Subject: [PATCH v2 2/2] console: don't select first registered console if
 stdout-path used
In-Reply-To: <20170828165807.8408-3-Eugeniy.Paltsev@synopsys.com>
References: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
 <20170828165807.8408-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170905145405.GH8741@pathway.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Mon 2017-08-28 19:58:07, Eugeniy Paltsev wrote:
> In the current implementation we take the first console that
> registers if we didn't select one.
> 
> But if we specify console via "stdout-path" property in device tree
> we don't want first console that registers here to be selected.
> Otherwise we may choose wrong console - for example if some console
> is registered earlier than console is pointed in "stdout-path"
> property because console pointed in "stdout-path" property can be add as
> preferred quite late - when it's driver is probed.

register_console() is really twisted function. I would like to better
understand your problems before we add yet another twist there.

Could you please be more specific about your problems?
What was the output of "cat /proc/consoles" before and after the fix?
What exactly started and stopped working?


> We retain previous behavior for tty0 console (if "stdout-path" used)
> as a special case:
> tty0 will be registered even if it was specified neither
> in "bootargs" nor in "stdout-path".
> We had to retain this behavior because a lot of ARM boards (and some
> powerpc) rely on it.

My main concern is the exception for "tty". Yes, it was regiression
reported in the commit c6c7d83b9c9e6a8b3e ("Revert "console: don't
prefer first registered if DT specifies stdout-path""). But is this
the only possible regression?


All this is about the fallback code that tries to enable all
consoles until a real one with tty binding (newcon->device)
is enabled.

v1 version of you patch disabled this fallback code when a console
was defined by stdout-path in the device tree. This emulates
defining the console by console= parameter on the command line.

It might make sense until some complains that a console is not
longer automatically enabled while it was before. But wait.
Someone already complained about "tty0". We can solve this
by adding an exception for "tty0". And if anyone else complains
about another console, we might need more exceptions.

We might endup with so many exceptions that the fallback code
will be always used. But then we are back in the square
and have the original behavior before your patch.

This is why I would like to know more info about your problem.
We need to decide if it is more important than a regression.
Or if it can be fixed another way.

Best Regards,
Petr
