From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 29 Apr 2019 17:14:54 +0000
Subject: perf tools build broken after v5.1-rc1
References: <eeb83498-f37f-e234-4941-2731b81dc78c@synopsys.com>
 <20190422152027.GB11750@kernel.org> <20190425214800.GC21829@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2505837@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/25/19 2:48 PM, Arnaldo Carvalho de Melo wrote:
> Em Mon, Apr 22, 2019 at 12:20:27PM -0300, Arnaldo Carvalho de Melo escreveu:
>> Em Fri, Apr 19, 2019 at 04:32:58PM -0700, Vineet Gupta escreveu:
>>> When building perf for ARC (v5.1-rc2) I get the following
>>  
>>> | In file included from bench/futex-hash.c:26:
>>> | bench/futex.h: In function 'futex_wait':
>>> | bench/futex.h:37:10: error: 'SYS_futex' undeclared (first use in this function);
>>  
>>> git bisect led to 1a787fc5ba18ac767e635c58d06a0b46876184e3 ("tools headers uapi:
>>> Sync copy of asm-generic/unistd.h with the kernel sources")
>> Humm, I have to check why this:
>>
>> [perfbuilder at quaco ~]$ podman images | grep ARC
>> docker.io/acmel/linux-perf-tools-build-fedora                24-x-ARC-uClibc          4c259582a8e6   5 weeks ago      846 MB
>> [perfbuilder at quaco ~]$
>>
>> isn't catching this... :-\
>>
>> FROM docker.io/fedora:24
>> MAINTAINER Arnaldo Carvalho de Melo <acme at kernel.org>
>> ENV TOOLCHAIN=arc_gnu_2017.09-rc2_prebuilt_uclibc_le_arc700_linux_install
>> ENV CROSS=arc-linux-
>> ENV SOURCEFILE=${TOOLCHAIN}.tar.gz
>> RUN dnf -y install make flex bison binutils gcc wget tar bzip2 bc findutils xz
>> RUN wget https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_toolchain_releases_download_arc-2D2017.09-2Drc2_-24-257BSOURCEFILE-257D&d=DwIDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=HjtufCLozrW47pS5C2YH3safLHQE7eEtmHFZsSWrz1M&s=29g4oKvGuYcLgheCUvZh3wojhhljivpLd8aj7Ur4sKQ&e=
>> <SNIP>
>> COPY rx_and_build.sh /
>> ENV EXTRA_MAKE_ARGS=NO_LIBBPF=1
>> ENV ARCH=arc
>> ENV CROSS_COMPILE=/${TOOLCHAIN}/bin/${CROSS}
>> ENV EXTRA_CFLAGS=-matomic
> So, now I have a libnuma crossbuilt in this container that allows me to
> build a ARC perf binary linked with zlib and numactl-devel, but only
> after I applied the fix below.
>
> Can you please provide the feature detection header in the build? I.e.
> what I have with my ARC cross build container right now, after applying
> the patch below is:
>
> [perfbuilder at 60d5802468f6 perf]$ make $EXTRA_MAKE_ARGS ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE EXTRA_CFLAGS="$EXTRA_CFLAGS" -C /git/perf/tools/perf O=/tmp/build/perf
> make: Entering directory '/git/perf/tools/perf'
>   BUILD:   Doing 'make -j8' parallel build
> sh: line 0: command: -c: invalid option
> command: usage: command [-pVv] command [arg ...]
>
> Auto-detecting system features:
> ...                         dwarf: [ OFF ]
> ...            dwarf_getlocations: [ OFF ]
> ...                         glibc: [ on  ]

Not related to current issue, this run uses a uClibc toolchain and yet it is
detecting glibc - doesn't seem right to me.

> ...                          gtk2: [ OFF ]
> ...                      libaudit: [ OFF ]
> ...                        libbfd: [ OFF ]
> ...                        libelf: [ OFF ]
> ...                       libnuma: [ on  ]

Wondering why that is - for me numa is off - even when using a glibc toolchain.

> ...        numa_num_possible_cpus: [ on  ]
> ...                       libperl: [ OFF ]
> ...                     libpython: [ OFF ]
> ...                      libslang: [ OFF ]
> ...                     libcrypto: [ OFF ]
> ...                     libunwind: [ OFF ]
> ...            libdw-dwarf-unwind: [ OFF ]
> ...                          zlib: [ OFF ]
> ...                          lzma: [ OFF ]
> ...                     get_cpuid: [ OFF ]
> ...                           bpf: [ on  ]
> ...                        libaio: [ OFF ]
> ...        disassembler-four-args: [ OFF ]
>
>

For my glibc toolchain, here's the feature detection output

Auto-detecting system features:
...                         dwarf: [ on  ]
...            dwarf_getlocations: [ OFF ]
...                         glibc: [ on  ]
...                          gtk2: [ OFF ]
...                      libaudit: [ OFF ]
...                        libbfd: [ OFF ]
...                        libelf: [ on  ]
...                       libnuma: [ OFF ]
...        numa_num_possible_cpus: [ OFF ]
...                       libperl: [ OFF ]
...                     libpython: [ OFF ]
...                      libslang: [ OFF ]
...                     libcrypto: [ OFF ]
...                     libunwind: [ OFF ]
...            libdw-dwarf-unwind: [ OFF ]
...                          zlib: [ OFF ]
...                          lzma: [ OFF ]
...                     get_cpuid: [ OFF ]
...                           bpf: [ on  ]
...                        libaio: [ on  ]
...        disassembler-four-args: [ OFF ]
