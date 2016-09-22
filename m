From: danielmentz@google.com (Daniel Mentz)
Date: Thu, 22 Sep 2016 15:37:35 -0700
Subject: modules still have .debug_* (was Re: [PATCH 0/3] ARC unwinder
 switch to .eh_frame)
In-Reply-To: <caee47ec-eb68-59ee-50dc-ee02c4d78b7d@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
 <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
 <caee47ec-eb68-59ee-50dc-ee02c4d78b7d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAE2F3rBR872+M=mm7Qa5cccrtmOOp5cyZKSWjc4ytOG717jxKQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Sep 22, 2016 at 1:59 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> Hi Daniel,
>
> On 09/19/2016 06:21 PM, Daniel Mentz wrote:
>> I confirmed that the .eh_frame section is present and that the
>> .debug_frame section is absent. I also verified that the file size of
>> the .ko files are small enough for our embedded platform and that
>> unnecessary sections like .debug_info, .debug_line, .debug_str etc.
>> are also absent.
>
> BTW it seems with my latest set of patches, modules still have .debug_*.
> Can you double check if your tree still has the interim patch which added a linker
> script for modules to strip out .debug_*
>
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001483.html

Hi Vineet,

Sorry, that was a misunderstanding. Buildroot routinely runs the strip
command on .ko files before installing them on the target. I was only
looking at the .ko files *after* running the strip command. No, the
interim patch was not in my tree.

I confirmed that your commit "ARC: dw2 unwind: don't force dwarf 2" is
indeed necessary to suppress the .debug_* sections when
CONFIG_DEBUG_INFO is off. But again, we're stripping .ko files anyways
before installing.

> I'm not planning to carry it and would prefer addressing the the root cause by
> removing the -gdwarf-2 toggle. I've added that and pushed rebased series. Care to
> take it for a respin please.

I downloaded your latest commit
e47305af57d7eedc10b4720e604d669b10c69e3b and verified that stack
traces are properly displayed for code inside kernel modules as well
as vmlinux. I also called memcpy() on some bad address and got a
proper stack trace that involved memcpy().

I conclude that unwinding works for us.

Thank You
 Daniel
