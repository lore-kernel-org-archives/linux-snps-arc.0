From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 1 Sep 2016 11:28:29 -0700
Subject: [PATCH] perf tools: Fix static building
In-Reply-To: <20160831072128.GB4740@krava>
References: <1471887222-26270-1-git-send-email-abrodkin@synopsys.com>
 <20160831072128.GB4740@krava>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8deeb70b-6fe8-32c5-9f6f-65b2d6bd70eb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/31/2016 12:21 AM, Jiri Olsa wrote:
> On Mon, Aug 22, 2016@08:33:42PM +0300, Alexey Brodkin wrote:
>> With commit e3d09ec8126f ("tools lib traceevent: Export dynamic symbols
>> used by traceevent plugins") we started to add "--dynamic-list" in
>> LDFLAGS. One side-effect of that was inability to build really
>> statically-linked perf.
> 
> IIRC --dynamic-list forces perf to exports some symbols to
> be used by plugins.. don't see this breaking static build
> 
> also it's working properly for me:
> 
> [jolsa at krava perf]$ make LDFLAGS=-static
> ...
> [jolsa at krava perf]$ ldd ./perf
>         not a dynamic executable
> 
> unless I miss what you mean by 'really statically-linked' ;-)

Right - so I tried this as well and indeed I can confirm that it builds for me as
static. Atleast the build system doesn;t need changing as -sattic being propagated
to fianl link cmd.

There seems to be some weirdness with ARC tools: file reports

| ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV),
| dynamically linked, interpreter *empty*, for GNU/Linux 3.9.0, not stripped


That is clearly wrong !

And the static binary as expected doesn't seem to run on target - exits with -EACCESS.

-Vineet
