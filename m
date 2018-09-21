From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 11:41:17 +0000
Subject: [OE-core] [PATCH v2 8/9] binutils: Fix Glibc building for ARC
In-Reply-To: <CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-9-abrodkin@synopsys.com>
 <CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a370dc1964172f81c3c8fec7a3165d0657ad6042.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Ross,

On Fri, 2018-09-21@11:55 +0100, Burton, Ross wrote:
> I don't like accumulating pending patches for something as key as
> binutils, are these actually working their way upstream now?

Sure they are!

Our team development is very upstream targeted, i.e. we try to
submit all our changes upstream. But with Binutils we're lagging
behind upstream a bit because recently we made some significant reworks
and now catching up with upstream.

What's more my colleague Claudiu Zissulescu recently became
official Binutils maintainer for ARC, see
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=02d7a79e1b93240729a52246432d9a84583bcf82
so I expect less and less patches for ARC will be "pending".

Not sure though if that makes much sense.

-Alexey
