From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 3 Jun 2019 08:31:38 +0000
Subject: [PATCH] ARC: build: Try to guess CROSS_COMPILE with
 cc-cross-prefix
In-Reply-To: <CAK7LNASiHzar3JmzGB1fgUYUC91F3FPsALj3iMhANTjGgnux5w@mail.gmail.com>
References: <20190603063119.36544-1-abrodkin@synopsys.com>
 <CAK7LNASiHzar3JmzGB1fgUYUC91F3FPsALj3iMhANTjGgnux5w@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB012004A6281FFE93B8191F30A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Masahiro-san,

> -----Original Message-----
> From: Masahiro Yamada <yamada.masahiro at socionext.com>
> Sent: Monday, June 3, 2019 11:18 AM
> To: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: arcml <linux-snps-arc at lists.infradead.org>; Linux Kernel Mailing List <linux-
> kernel at vger.kernel.org>; Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Subject: Re: [PATCH] ARC: build: Try to guess CROSS_COMPILE with cc-cross-prefix
> 
> Hi Alexey,
> 
> On Mon, Jun 3, 2019 at 3:42 PM Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:

[snip]

> > A side note: even though "cc-cross-prefix" does its job it pollutes
> > console with output of "which" for all the prefixes it didn't manage to find
> > a matching cross-compiler for like that:
> > | # ARCH=arc make defconfig
> > | which: no arceb-linux-gcc in (~/.local/bin:~/bin:/usr/bin:/usr/sbin)
> > | *** Default configuration is based on 'nsim_hs_defconfig'
> 
> 
> Oh really?
> 
> masahiro at pug:~$ which arc-linux-gcc
> /home/masahiro/tools/arc/bin/arc-linux-gcc
> masahiro at pug:~$ which dummy-linux-gcc
> masahiro at pug:~$ echo $?
> 1
> 
> 
> When 'which' cannot find the given command,
> it does not print anything to stderr.
> 
> Does it work differently on your machine?

Well on Ubuntu 18.04 indeed which doesn't show anything
but on my build-server with CentOS 7 I'm getting mentioned verbose output:
| #?cat /etc/redhat-release
| CentOS Linux release 7.3.1611 (Core)

| #?/usr/bin/which -v
| GNU which v2.20, Copyright (C) 1999 - 2008 Carlo Wood.
| GNU which comes with ABSOLUTELY NO WARRANTY;
| This program is free software; your freedom to use, change
| and distribute this program is protected by the GPL.

-Alexey
