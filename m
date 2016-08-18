From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 18 Aug 2016 09:03:08 -0700
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <20160818140722.GC16916@redhat.com>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/18/2016 07:07 AM, Arnaldo Carvalho de Melo wrote:
> Em Wed, Aug 17, 2016 at 01:00:50PM -0700, Vineet Gupta escreveu:
>> perf tools build in recent kernels spews splat when cross compiling with uClibc
>>
>> |   CC       util/alias.o
>> | In file included from tools/perf/util/../ui/../util/cache.h:8:0,
>> |                 from tools/perf/util/../ui/helpline.h:7,
>> |                 from tools/perf/util/debug.h:8,
>> |                 from arch/../util/cpumap.h:9,
>> |                 from arch/../util/env.h:5,
>> |                 from arch/common.h:4,
>> |                 from arch/common.c:3:
>> | tools/include/linux/string.h:12:15: warning: redundant redeclaration of ?strlcpy? [-Wredundant-decls]
>> |  extern size_t strlcpy(char *dest, const char *src, size_t size);
>>                ^
>> This is after commit 61a6445e463a31 ("tools lib: Guard the strlcpy() header with
>> __GLIBC__"). While the commit was right in theory, issue is uClibc also
>> defines __GLIBC__ for application headers.
>>
>> Instead of reverting the commit, manually revert with some addeed commentary to
>> same effect.
> 
> Well, you can't revert it, as this will make it break elsewhere.

Just curious, your last change to use ifdef GLIBC vs. ifndef UCLIBC was just a
preventive fix or was it addressing something reported.

> So
> please check if
> 
> #if defined(__GLIBC__) && !defined(__UCLIBC__)
> 
> suits uclibc.

Yes that works as well - I'll send a v2.

> Are you aware of any readily available tarball or docker image that has
> a uclibc based devel env that I could grab? I'd add it to my build setup
> to make sure I (and my downstreamers) don't break uclibc environments in
> the future.

A prebuilt toolchain would just suffice.

https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2016.03/arc_gnu_2016.03_prebuilt_uclibc_le_archs_linux_install.tar.gz

Thx,
-Vineet
