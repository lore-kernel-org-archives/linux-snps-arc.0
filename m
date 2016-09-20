From: danielmentz@google.com (Daniel Mentz)
Date: Mon, 19 Sep 2016 18:21:48 -0700
Subject: [PATCH 0/3] ARC unwinder switch to .eh_frame
In-Reply-To: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Thank you for your patches. I applied them, and verified that
unwinding works with code that is compiled into the kernel image as
well as kernel modules.
I confirmed that the .eh_frame section is present and that the
.debug_frame section is absent. I also verified that the file size of
the .ko files are small enough for our embedded platform and that
unnecessary sections like .debug_info, .debug_line, .debug_str etc.
are also absent.
Is there anything else you want me to test?
Thanks
Daniel


On Mon, Sep 19, 2016 at 2:49 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> Hi Daniel,
>
> Give these a shot and let me know if they work fine for you.
> I'm working on some more improvements to unwinder which will follow
> a bit later.
>
> Thx,
> -Vineet
>
> Vineet Gupta (3):
>   ARC: module: support R_ARC_32_PCREL relocation
>   ARC: dw2 unwind: factor CIE specifics for .eh_frame/.debug_frame
>   ARC: dw2 unwind: switch to .eh_frame based unwinding
>
>  arch/arc/Makefile             |  2 ++
>  arch/arc/include/asm/elf.h    |  3 +--
>  arch/arc/kernel/entry.S       | 12 ------------
>  arch/arc/kernel/module.c      | 19 ++++++++-----------
>  arch/arc/kernel/unwind.c      | 24 +++++++++++++++++-------
>  arch/arc/kernel/vmlinux.lds.S | 15 +++++----------
>  6 files changed, 33 insertions(+), 42 deletions(-)
>
> --
> 2.7.4
>
