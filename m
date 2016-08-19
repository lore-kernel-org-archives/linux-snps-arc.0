From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Aug 2016 14:27:58 -0700
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <20160819200843.GB20810@kernel.org>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
 <20160819142207.GA4966@kernel.org>
 <868d62af-a673-80f8-2071-9043394f20fe@synopsys.com>
 <20160819192302.GA20810@kernel.org> <20160819200843.GB20810@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0ad144ea-21b2-ab10-3ef5-68078ee32631@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/19/2016 02:10 PM, Arnaldo Carvalho de Melo wrote:
>> But one question: when you test build, do you have any extra devel
>> > packages installed besides what is in this prebuilt toolchain tarball?
>> > 
>> > I'll add at least zlib and elfutils to the mix, building it in the
>> > docker image creation process, and then testing with/without
>> > NO_LIBELF=1, as I do to other cross-building images:
> Trying to build elfutils 0.166:
>
> checking whether gcc accepts -Wduplicated-cond... no
> checking whether gcc accepts -Wnull-dereference... no
> configure: WARNING: "libc does not have argp"
> checking for argp_parse in -largp... no
> configure: error: "no libargp found"
>
> ----
>
> will go errands now, will try to check what is needed to build elfutils
> with uclibc, ideas?

So back in 3.2 days I ran into these issues with elfutils - the workaround was to
use the standalone libelf
http://www.mr511.de/software/libelf-0.8.9.tar.gz.

Not sure if you will be willing to take that path.

OTOH, you could use standalone argp @ http://www.lysator.liu.se/~nisse/archive but
it seems that requires a bunch of patches too - from looking into the
corresponding buildroot package folder. Give this a shot - otherwise it is easier
to just build a custom toolchain with pre-req packages from buildroot. Or can be
provided if you so deem fit !

-Vineet
