From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 27 Nov 2018 14:24:02 -0800
Subject: failing ARC builds in kernelCI
In-Reply-To: <04dd1f535c69e36177595ed823b70d5225385dc0.camel@synopsys.com>
References: <CAOi56cX4sV=jD0ctuQROh3r8JtcL4285i-g8k7Ew3knnD3v8Ww@mail.gmail.com>
 <2b7adbb0eeef90de6895889be814fd632e20a22f.camel@synopsys.com>
 <04dd1f535c69e36177595ed823b70d5225385dc0.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7hva4ijh19.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <alexey.brodkin at synopsys.com> writes:

> BTW judging by the error [1] "arc-linux-ld: error: vmlinux.o: unable to merge ISA extension attributes code-density."
> I may assume we again bump into situation of building ARCompact kernel with ARCv2 toolchain.
>
> Also what hints to that problem is our default defconfig is "nsim_700_defconfig" which
> obviously ARCompact, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Makefile#n9
>
> Thus I think the simplest option would be to switch to say "nsim_hs_defconfig" for
> default one, but that requires Vineet's ack.

I tried that, but that's not the only thing required. Because the
Kconfig default the ISA is ISA_ARCOMPACT, allnoconfig uses that, no
matter what the default in the Makefile is.  And, since tinyconfig is
based on allnoconfig, it has the same problem.

I submitted a patch[1] that gets this working for me, and with that, 'make
defconfig', 'make allnoconfig' and 'make tinyconfig' all work with ARCv2
by default.

Kevin

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-November/004863.html

>
> -Alexey
>
> [1] https://kernelci.org/build/id/5bfd5cbe59b51413138b6da0/logs/
>
> On Tue, 2018-11-27@15:38 +0000, Alexey Brodkin wrote:
>> Hi Kevin,
>> 
>> On Tue, 2018-11-27@07:23 -0800, Kevin Hilman wrote:
>> > Hi Alexey,
>> > 
>> > You may have noticed that some defconfigs are failing to build
>> > upstream for ARC.  For example, on mainline, both allnoconfig and
>> > tinyconfig fail to build[1].
>> 
>> Actually I haven't seen that!
>>  1. I used to check 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__kernelci.org_soc_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=Yt-UgnQ5sp-_dEc2MtGZg0QqdnhXBo5Xwvw1tb_a6gA&s=KXGPL3Q7lsPxI1vH-M5m_JDTQ5czcfO7hTNdGXJsqfU&e=
>> but there's still no mention
>>     of ARC so I thought builds for ARC are not enabled still.
>>  2. I haven't seen any email notifications as well if they exist at all.
>> 
>> That said it would be good if warning emails are sent to our mailing-list
>> linux-snps-arc at lists.infradead.org (see in Cc as well) so somebody reacts on them.
>> 
>> 
>> > Do you guys have any plans to fix these, or should we disable them?
>> > We currently build these for all the other arches.,
>> 
>> Sure, let me take a look right now.
>> 
>> > Kevin
>> > 
>> > [1] 
>> > https://urldefense.proofpoint.com/v2/url?u=https-3A__kernelci.org_build_mainline_branch_master_kernel_v4.20-2Drc4-2D7-2Dgef78e5ec9214_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=Yt-UgnQ5sp-_dEc2MtGZg0QqdnhXBo5Xwvw1tb_a6gA&s=mAOgc823jx9R9N4t6nQ4AW9E8kdexU-Y3V5-t50CwJo&e=
>> 
>> -Alexey
>> _______________________________________________
>> linux-snps-arc mailing list
>> linux-snps-arc at lists.infradead.org
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=Yt-UgnQ5sp-_dEc2MtGZg0QqdnhXBo5Xwvw1tb_a6gA&s=CjFcD6LV0UctpHpPG5sETrRyEMzZdu4HNEfoozl-y2c&e=
