From: jolsa@redhat.com (Jiri Olsa)
Date: Wed, 12 Apr 2017 12:19:53 +0200
Subject: perf jvmti: unconditionally links against -lelf
In-Reply-To: <1491991105.4510.25.camel@synopsys.com>
References: <1491991105.4510.25.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170412101953.GB14409@krava>
To: linux-snps-arc@lists.infradead.org

On Wed, Apr 12, 2017@09:58:26AM +0000, Alexey Brodkin wrote:
> Hi Jiri,
> 
> Just tried to cross-compile perf with pretty bare-minimal toolchain
> which has no libelf installed for the target (for the record I used
> SNPS ARC pre-built arc-2016.09 tools) like that:
> --------------->8------------
> make NO_LIBELF=1
> --------------->8------------
> 
> And got the following build failure:
> --------------->8------------
> ? LINK?????libperf-jvmti.so
> .../2016.09-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/6.2.1/../../../../arc-snps-linux-uclibc/bin/ld: cannot find -lelf
> --------------->8------------
> 
> First I was surprised because I intentionally disabled usage of libelf
> but after some grepping figured out jvmti is linked against libelf
> regardless any settings, see:
> --------------->8------------
> $(OUTPUT)$(LIBJVMTI): $(LIBJVMTI_IN)
> ? ? ? ?$(QUIET_LINK)$(CC) -shared -Wl,-soname -Wl,$(LIBJVMTI) -o $@ $< -lelf -lrt
> endif
> --------------->8------------
> 
> This comes from commit?d4dfdf00d43e ("perf jvmti: Plug compilation into perf build").
> 
> I'm not really sure what could be the best solution to the problem I see.
> If libelf is a real must for jvmti then probably we may force set?NO_JVMTI=1
> if?NO_LIBELF=1 is passed on the command line.
> 
> At least the following builds perf for me without issues:
> --------------->8------------
> make NO_LIBELF=1 NO_JVMTI=1
> --------------->8------------

hi,
incidently, David just posted patch for this ;-)
  http://marc.info/?l=linux-kernel&m=149197980107421&w=2

should be merged soon

jirka
