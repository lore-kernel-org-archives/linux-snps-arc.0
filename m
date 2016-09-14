From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 14 Sep 2016 16:21:12 +0000
Subject: [PATCH] perf tools: Fix static building
In-Reply-To: <8deeb70b-6fe8-32c5-9f6f-65b2d6bd70eb@synopsys.com>
References: <1471887222-26270-1-git-send-email-abrodkin@synopsys.com>
 <20160831072128.GB4740@krava>
 <8deeb70b-6fe8-32c5-9f6f-65b2d6bd70eb@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473869942.3766.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet, Jiri,

On Thu, 2016-09-01@11:28 -0700, Vineet Gupta wrote:
> On 08/31/2016 12:21 AM, Jiri Olsa wrote:
> > 
> > On Mon, Aug 22, 2016@08:33:42PM +0300, Alexey Brodkin wrote:
> > > 
> > > With commit e3d09ec8126f ("tools lib traceevent: Export dynamic symbols
> > > used by traceevent plugins") we started to add "--dynamic-list" in
> > > LDFLAGS. One side-effect of that was inability to build really
> > > statically-linked perf.
> > 
> > IIRC --dynamic-list forces perf to exports some symbols to
> > be used by plugins.. don't see this breaking static build
> > 
> > also it's working properly for me:
> > 
> > [jolsa at krava perf]$ make LDFLAGS=-static
> > ...
> > [jolsa at krava perf]$ ldd ./perf
> > ????????not a dynamic executable
> > 
> > unless I miss what you mean by 'really statically-linked' ;-)
> 
> Right - so I tried this as well and indeed I can confirm that it builds for me as
> static. Atleast the build system doesn;t need changing as -sattic being propagated
> to fianl link cmd.
> 
> There seems to be some weirdness with ARC tools: file reports
> 
> > 
> > ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV),
> > dynamically linked, interpreter *empty*, for GNU/Linux 3.9.0, not stripped
> 
> 
> That is clearly wrong !
> 
> And the static binary as expected doesn't seem to run on target - exits with -EACCESS.

I may confirm what Vineet said already adding just that funny ldd output on target:
-------------------->8-----------------
# ldd /home/perf?
	 =>??(0x00000000)
-------------------->8-----------------

Just for comparison that's ldd output for dynamically built perf:
-------------------->8-----------------
# ldd /usr/bin/perf?
checking sub-depends for '/lib/libpthread.so.0'
checking sub-depends for '/lib/librt.so.0'
checking sub-depends for '/lib/libm.so.0'
checking sub-depends for '/lib/libdl.so.0'
checking sub-depends for '/lib/libc.so.0'
	libpthread.so.0 => /lib/libpthread.so.0 (0x00000000)
	librt.so.0 => /lib/librt.so.0 (0x00000000)
	libm.so.0 => /lib/libm.so.0 (0x00000000)
	libdl.so.0 => /lib/libdl.so.0 (0x00000000)
	libc.so.0 => /lib/libc.so.0 (0x00000000)
	/lib/ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x00000000)
-------------------->8-----------------

And most probably the reason for me to think perf built with LDFLAGS=-static
was not static is indeed "file" output:
-------------------->8-----------------
file tools/perf/perf
tools/perf/perf: ELF 32-bit LSB executable, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
3.9.0, not stripped
-------------------->8-----------------

Sorry for the noise.

-Alexey
