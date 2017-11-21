From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Nov 2017 13:47:22 -0800
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <CAKCAbMgdV8ieHvkhf6B0OkqsmpBYWSgZoi21rBeDRQB=yegMkQ@mail.gmail.com>
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
 <CAKCAbMgdV8ieHvkhf6B0OkqsmpBYWSgZoi21rBeDRQB=yegMkQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5d8601a2-5efa-4814-c965-d9187f9a2f5e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/21/2017 01:40 PM, Zack Weinberg wrote:
> On Tue, Nov 21, 2017 at 4:25 PM, Vineet Gupta
>>
>> make subdirs=nptl check fails as librt.so fails to link due to missing
>> pthread symbols. The real librt built does have libpthread.so in its link
>> cmd hence is fine, but not this librt.
> 
> I've tripped over this myself but only when trying to do an
> incremental rebuild under conditions where an incremental build won't
> work.  I do not know what those conditions are: I only know that
> blowing away the build tree and starting over from scratch has, until
> now, cured the problem.
> 
> Are you seeing this in a build from scratch, not overriding subdirs?

This is a rebuild for make check. So I have a cross compilation setup using 
builroot (to include my glibc branch from github etc). After the toolchain builds, 
I go to  build/glibc/build and do make check, (doing with subdirs=nptl is same)

But I know exactly what the problem is: libpthread.so is not present in the link 
cmd for build/nptl/librt.so. I just don't know hoe to coax the build system to 
include it (apparently that happens for the canonical rt/librt.so)

-Vineet
