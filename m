From: raj.khem@gmail.com (Khem Raj)
Date: Wed, 26 Sep 2018 21:25:57 -0700
Subject: ARC: machine dictionary - ARCompact vs ARCv2
In-Reply-To: <e00126b08d5895fa7e4cc2fb0b8eaa9effb75cc4.camel@synopsys.com>
References: <e00126b08d5895fa7e4cc2fb0b8eaa9effb75cc4.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1soTGWbiB4AV9+PjZOD6aU7YwQ7B=Ejex2tzThLeU0pn4Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 25, 2018 at 4:57 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hello,
>
> While upstreaming ARC bits in OE core I faced one interesting challenge.
>
> As of today we have 2 binary-incompatible 32-bit ISAs (Instruction Set Arch):
>  1. ARCompact (AKA ARCv1) and
>  2. ARCv2
>
> In Binutils they have 2 separate machine numbers: EM_ARC_COMPACT=93 for ARCompact,
> see [1] and EM_ARC_COMPACT2=195 for ARCv2, see [2].
>
> Still we call them both "arc" and so I'm not sure what would be the right way
> of handling that mess in OE's machine dictionary.

mess is the right word. My preference would be to keep the newer
one in OE as the support is new,

>
> For now I just have separate instances of "arc_machine_dict" for ARCompact [3]
> and ARCv2 [4] and depending on what a given OE "machine" includes as "tune-arcX.inc"
> build system uses one or another dictionary entry.
>
> Even though it works fine it doesn't fit into common dictionary in meta/lib/oe/elf.py.
>
> Any suggestions on how ARC machine dictionary might be upstreamed?

you can define a separate arch like x32 is for x86_64 arch. but I think
PACKAGEQA_EXTRA_MACHDEFFUNCS is a way to hook in such ana

>
> -Alexey
>
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=e194274305663f565c6beee5ec21dbed70cdac46;hb=HEAD#l202
> [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=e194274305663f565c6beee5ec21dbed70cdac46;hb=HEAD#l309
> [3]
> https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/083958dedbd60c022432a17e952638a41e37c3dc/conf/machine/include/tune-arcompact.inc#L25
> [4]
> https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/083958dedbd60c022432a17e952638a41e37c3dc/conf/machine/include/tune-arcv2.inc#L38
