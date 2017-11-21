From: zackw@panix.com (Zack Weinberg)
Date: Tue, 21 Nov 2017 16:40:11 -0500
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKCAbMgdV8ieHvkhf6B0OkqsmpBYWSgZoi21rBeDRQB=yegMkQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 21, 2017 at 4:25 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> Hi,
>
> I've been trying to run glibc test suite as part of prereq for ARC port
> submission, running into some landmines.
>
> make subdirs=nptl check fails as librt.so fails to link due to missing
> pthread symbols. The real librt built does have libpthread.so in its link
> cmd hence is fine, but not this librt.

I've tripped over this myself but only when trying to do an
incremental rebuild under conditions where an incremental build won't
work.  I do not know what those conditions are: I only know that
blowing away the build tree and starting over from scratch has, until
now, cured the problem.

Are you seeing this in a build from scratch, not overriding subdirs?

zw
