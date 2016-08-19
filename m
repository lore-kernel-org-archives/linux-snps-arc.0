From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Aug 2016 13:09:51 -0700
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <20160819192302.GA20810@kernel.org>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
 <20160819142207.GA4966@kernel.org>
 <868d62af-a673-80f8-2071-9043394f20fe@synopsys.com>
 <20160819192302.GA20810@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <45c665be-5965-32d9-b32b-b55c0cd29435@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/19/2016 12:23 PM, Arnaldo Carvalho de Melo wrote:
> .
> But one question: when you test build, do you have any extra devel
> packages installed besides what is in this prebuilt toolchain tarball?

No - not when doing this with minimal cross tools - we do have Buildroot where
libelf and zlib as cross devel packages.

> I'll add at least zlib and elfutils to the mix, building it in the
> docker image creation process, and then testing with/without
> NO_LIBELF=1, as I do to other cross-building images:

But that won't work with tools you got now - I can have someone provide you
prebuilt tools off of Buildroot with those packages included. Or if you could be
arsed that is really easy to do off upstream buildroot :-)

>  
>> Thx a bunch for doing this Arnaldo - CROSS build and uclibc had a tendency to
>> break here and there so this will catch errors early.
> Hopefully this is something of the past :-)

Cool stuff - thx once again !

-Vineet
