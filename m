From: arnd@arndb.de (Arnd Bergmann)
Date: Tue, 20 Jun 2017 17:27:36 +0200
Subject: [PATCH 03/20] asm-generic: Drop getrlimit and setrlimit syscalls
 from default list
In-Reply-To: <20170620145451.y72j77rbcni27dus@yury-thinkpad>
References: <20170619155003.13218-1-ynorov@caviumnetworks.com>
 <20170619155003.13218-4-ynorov@caviumnetworks.com>
 <20170619214223.GS6973@jhogan-linux.le.imgtec.org>
 <CAK8P3a0M2TkoUY4KBgmtnh3NDNj-oSNOpVagHVFuFBEYnAYp8Q@mail.gmail.com>
 <20170619221023.GT6973@jhogan-linux.le.imgtec.org>
 <20170620133714.j2e3z535xsmphusl@yury-thinkpad>
 <CAK8P3a0kSe_EcZ=5Dq=Pvtth4tTNiNaa=_=rCvaie4jzF58dNw@mail.gmail.com>
 <20170620145451.y72j77rbcni27dus@yury-thinkpad>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a1rXfrXotJa=mZf3cJu+WVWHKWjTMk8FA16xnkGvU0MmQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Jun 20, 2017@4:54 PM, Yury Norov <ynorov@caviumnetworks.com> wrote:
> On Tue, Jun 20, 2017@04:20:43PM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 20, 2017@3:37 PM, Yury Norov <ynorov@caviumnetworks.com> wrote:
>> > On Mon, Jun 19, 2017@11:10:23PM +0100, James Hogan wrote:
>> >> On Mon, Jun 19, 2017@11:58:41PM +0200, Arnd Bergmann wrote:

>> > I would also notice riscv people and welcome to the discussion.
>> >
>> > As there is more than 1 arch that goes to be added to linux soon,
>> > maybe it's better to upstream my ans James' patches separately
>> > from other ilp32 patches? Arnd?
>>
>> Do you mean upstream those two patches slightly later? That's
>> fine with me, I don't care much whether the old new stat is part
>> of the syscall table for arm64-ilp32 or not, I'd leave that up to
>> you, depending on whether you want to do the rework or not.
>
> I mean that if we want to deprecate rlimit and stat syscalls for
> architectures that are under development now, it's better to upstream
> patches that actually deprecate it as early as possible.

Makes sense.

>> I suppose the arm64-ilp32 could benefit from not having to support
>> the old arm32 stat structure, but doing the new syscalls based on
>> statx could delay the glibc port some more, as there are some open
>> questions about how that would best be integrated.
>
> OK. Let's leave things as is. But then I don't see any reason to
> add unxstat patch to ilp32 series if ilp32 will not disable it.

Right, that's what I meant: let's leave the rlimit patch in your series
as it matches the work you have already done, and is the right
thing to do, and let's do the unxstat patch separately so it doesn't
cause you extra work.

        Arnd
