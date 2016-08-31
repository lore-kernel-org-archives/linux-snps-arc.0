From: jolsa@redhat.com (Jiri Olsa)
Date: Wed, 31 Aug 2016 09:21:28 +0200
Subject: [PATCH] perf tools: Fix static building
In-Reply-To: <1471887222-26270-1-git-send-email-abrodkin@synopsys.com>
References: <1471887222-26270-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160831072128.GB4740@krava>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 22, 2016@08:33:42PM +0300, Alexey Brodkin wrote:
> With commit e3d09ec8126f ("tools lib traceevent: Export dynamic symbols
> used by traceevent plugins") we started to add "--dynamic-list" in
> LDFLAGS. One side-effect of that was inability to build really
> statically-linked perf.

IIRC --dynamic-list forces perf to exports some symbols to
be used by plugins.. don't see this breaking static build

also it's working properly for me:

[jolsa at krava perf]$ make LDFLAGS=-static
...
[jolsa at krava perf]$ ldd ./perf
        not a dynamic executable

unless I miss what you mean by 'really statically-linked' ;-)

Maybe different features enabled/build environment could you
please send the .config-detected along with the build error?

thanks,
jirka
