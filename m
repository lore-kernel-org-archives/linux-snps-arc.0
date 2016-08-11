From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 11 Aug 2016 16:38:33 -0700
Subject: Problems with support of file locks for ARC (maybe for other
 targets too)
In-Reply-To: <3ABF60118B9B784CA5BF7C841D2F00ECFFF6E1@de02wembxa.internal.synopsys.com>
References: <3ABF60118B9B784CA5BF7C841D2F00ECFFEBBD@de02wembxa.internal.synopsys.com>
 <c7eb5d55-fb26-6423-23dc-11a9aeba5897@synopsys.com>
 <3ABF60118B9B784CA5BF7C841D2F00ECFFF6E1@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <005bcb5f-f2a6-8a07-f07d-540721e2cf67@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/11/2016 09:12 AM, Yuriy Kolerov wrote:
>
>>>  Moreover the whole uClibc and every application must be compiled with
>> those macros. Here is my question. Is it acceptable just to compile toolchain
>> itself using CFLAGS_FOR_TARGET with those macros and don?t define them
>> manually in each application?
>>
>> If you enable LFS support in build system (uClibc or buildroot) these macros
>> will be automatically defined - no point or need to pass them as CFLAGS etc -
>> infact that would be wrong IMO.
> If you enable __UCLIBC_HAS_LFS__ while configuring uClibc then _LARGEFILE64_SOURCE and _FILE_OFFSET_BITS=64 will not be defined automatically. 

What was I smoking when replying ? You are correct - these macros have to be added
to each application's makefile or at top level as target C flags.

> E.g. Buildroot has this generic line in Makefile for packages:
>
> TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64

Actually BR dropped support for disabling LFS in 2015 - before that the line above
used to be guarded by BR2_LARGEFILE.

> These defines are not placed to config.h or somewhere else. They must be defined each time you compile anything. uClibc may be built by Buildroot with these flags by default (actually it is not true at least for ARC - Buildroot must be fixed but it is not a subject of this discussion). However you must define these macros manually when building every application later.

Right, I stand corrected.

> I don?t understand this thing - is it possible to compile uClibc with full support of LFS (see macros above) and don?t use this feature in applications and everything will be ok? 

Indeed this is the case - if you don't build with LFS, xxx64 won't even be
available to begin with.

> And is it possible to compile uClibc without _LARGEFILE64_SOURCE and _FILE_OFFSET_BITS=64 and compile applications with them and everything will be ok? 

This mostly likely won't work as those defines will not be present in headers to
use in application.

> Right now when we build toolchain for ARC using Buildroot uClibc is compiled without them and e.g. BusyBox is compiled with -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 ...

Buildroot now assumes LFS to be default (and you can't switch it off) so
everything including uClibc / Busybox has LFS enabled already.

>
>> So you really don't need LFS to be able to use locks - but need to make sure
>> that for common generic ABI - user struct flock pairs correctly with kernel
>> struct
>> flock64 with or w/o LFS.

But this point remains valid - for our ABI - kernel uses struct flock64 and this
needs to be binary compatible with uClibc struct flock and struct flock64 (LFS only)

Read the comment in libc/sysdeps/linux/common-generic/bits/stat.h

-Vineet
