From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 18:43:08 +0000
Subject: [PATCH 1/2] ARC: show_regs: avoid page allocator
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-2-git-send-email-vgupta@synopsys.com>
 <1545239047.14089.13.camel@synopsys.com>
 <49f9edc9-87ee-1efc-58f8-b0d9a52c8a49@synopsys.com>
 <e2d2c160-0ef6-5504-7824-032a5c70fa7f@I-love.SAKURA.ne.jp>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642388B@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 5:30 AM, Tetsuo Handa wrote:
>> | Stack Trace:
>> |  arc_unwind_core+0xcc/0x100
>> |  ___might_sleep+0x17a/0x190
>> |  mmput+0x16/0xb8
> Then, does mmput_async() help?
>

It helps, but then we get the next one (w/o my patch 2/2)

BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:23
in_atomic(): 1, irqs_disabled(): 0, pid: 69, name: segv-null-ptr
no locks held by segv-null-ptr/69.
CPU: 0 PID: 69 Comm: segv-null-ptr Not tainted 4.18.0+ #72

Stack Trace:
  arc_unwind_core+0xcc/0x100
  ___might_sleep+0x17a/0x190
  down_read+0x18/0x38
  show_regs+0x102/0x310
  get_signal+0x5ee/0x610
  do_signal+0x2c/0x218
  resume_user_mode_begin+0x90/0xd8
    @off 0x103d4 in [/segv-null-pt
