From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Aug 2016 11:01:49 -0700
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <20160819142207.GA4966@kernel.org>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
 <20160819142207.GA4966@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <868d62af-a673-80f8-2071-9043394f20fe@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/19/2016 07:22 AM, Arnaldo Carvalho de Melo wrote:
> Em Thu, Aug 18, 2016 at 09:03:08AM -0700, Vineet Gupta escreveu:
>> On 08/18/2016 07:07 AM, Arnaldo Carvalho de Melo wrote:
>>> Are you aware of any readily available tarball or docker image that has
>>> a uclibc based devel env that I could grab? I'd add it to my build setup
>>> to make sure I (and my downstreamers) don't break uclibc environments in
>>> the future.
>>
>> A prebuilt toolchain would just suffice.
>>
>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2016.03/arc_gnu_2016.03_prebuilt_uclibc_le_archs_linux_install.tar.gz
> 
> So, I did just that, from now on, before pushing things to Ingo, that
> prebuilt toolchain will be used in a docker container, please take a
> look at the Dockerfile and see if there is something missing from the
> cross build make command line:
> 
> # -------------------- 8< -------------------------------
> # docker.io/acmel/linux-perf-tools-build-fedora:24-x-ARC-uClibc
> FROM docker.io/fedora:24
> MAINTAINER Arnaldo Carvalho de Melo <acme at kernel.org>
> ENV TOOLCHAIN=arc_gnu_2016.03_prebuilt_uclibc_le_archs_linux_install
> RUN SOURCEFILE=${TOOLCHAIN}.tar.gz && \
>     dnf -y install make flex bison tar gzip && \
>     dnf -y clean all && \
>     mkdir -m 777 -p /tmp/build/perf && \
>     curl -OL https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2016.03/${SOURCEFILE} && \
>     tar xf ${SOURCEFILE} && \
>     rm -f ${SOURCEFILE} && \
>     groupadd -r perfbuilder && \
>     useradd -r -g perfbuilder perfbuilder
> USER perfbuilder
> ENTRYPOINT make -C /git/linux/tools/perf O=/tmp/build/perf ARCH=arc CROSS_COMPILE=/${TOOLCHAIN}/bin/arc-linux-

This is interesting. I thought CROSS_COMPILE provided the prefixes to make vars
and that PATH was still needed. But good if this works too so u don't have to
fudge PATH with ARC tools in your env.


> # -------------------- 8< -------------------------------
> 
> Do I have to pass some extra flags? Perhaps for sysroot?

No - the default sysroot just works.

> 
> With the above I get:
> 
>   # dm fedora:24-x-ARC-uClibc
>   1: 29.108592825 fedora:24-x-ARC-uClibc: Ok
>   # 
> 
> Which selected these features: 
> 
>   make: Entering directory '/git/linux/tools/perf'
>     BUILD:   Doing 'make -j4' parallel build
>   sh: line 0: command: -c: invalid option
>   command: usage: command [-pVv] command [arg ...]
> 
>   Auto-detecting system features:
>   ...                         dwarf: [ OFF ]
>   ...            dwarf_getlocations: [ OFF ]
>   ...                         glibc: [ on  ]
>   ...                          gtk2: [ OFF ]
>   ...                      libaudit: [ OFF ]
>   ...                        libbfd: [ OFF ]
>   ...                        libelf: [ OFF ]
>   ...                       libnuma: [ OFF ]
>   ...        numa_num_possible_cpus: [ OFF ]
>   ...                       libperl: [ OFF ]
>   ...                     libpython: [ OFF ]
>   ...                      libslang: [ OFF ]
>   ...                     libcrypto: [ OFF ]
>   ...                     libunwind: [ OFF ]
>   ...            libdw-dwarf-unwind: [ OFF ]
>   ...                          zlib: [ OFF ]
>   ...                          lzma: [ OFF ]
>   ...                     get_cpuid: [ OFF ]
>   ...                           bpf: [ on  ]
> 
>   Makefile.config:260: No libelf found, disables 'probe' tool and BPF support in 'perf record', please install libelf-dev, libelf-devel or elfutils-libelf-devel
>   Makefile.config:360: No sys/sdt.h found, no SDT events are defined, please install systemtap-sdt-devel or systemtap-sdt-dev
>   Makefile.config:433: Disabling post unwind, no support found.
>   Makefile.config:479: No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev
>   Makefile.config:490: No libcrypto.h found, disables jitted code injection, please install libssl-devel or libssl-dev
>   Makefile.config:505: slang not found, disables TUI support. Please install slang-devel, libslang-dev or libslang2-dev
>   Makefile.config:519: GTK2 not found, disables GTK2 support. Please install gtk2-devel or libgtk2.0-dev
>   Makefile.config:547: Missing perl devel files. Disabling perl scripting support, please install perl-ExtUtils-Embed/libperl-dev
>   Makefile.config:573: No python interpreter was found: disables Python support - please install python-devel/python-dev
>   Makefile.config:680: No liblzma found, disables xz kernel module decompression, please install xz-devel/liblzma-dev
>   Makefile.config:693: No numa.h found, disables 'perf bench numa mem' benchmark, please install numactl-devel/libnuma-devel/libnuma-dev
>   Makefile.config:750: Your gcc lacks the __get_cpuid() builtin, disables support for auxtrace/Intel PT, please install a newer gcc

Awesome - I presume it ran to completion and builds perf successfully.

Thx a bunch for doing this Arnaldo - CROSS build and uclibc had a tendency to
break here and there so this will catch errors early.

-Vineet
