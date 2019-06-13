From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 13 Jun 2019 10:57:45 -0700
Subject: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e5f45089-c3aa-4d78-2c8d-ed22f863d9ee@synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC Masami San

On 6/13/19 3:07 AM, Anshuman Khandual wrote:
> Questions:
> 
> AFAICT there is no equivalent of erstwhile notify_page_fault() during page
> fault handling in arc and mips archs which can call this generic function.
> Please let me know if that is not the case.

For ARC do_page_fault() is entered for MMU exceptions (TLB Miss, access violations
r/w/x etc). kprobes uses a combination of UNIMP_S and TRAP_S instructions which
don't funnel into do_page_fault().

UINMP_S leads to

instr_service
   do_insterror_or_kprobe
      notify_die(DIE_IERR)
         kprobe_exceptions_notify
            arc_kprobe_handler


TRAP_S 2 leads to

EV_Trap
   do_non_swi_trap
      trap_is_kprobe
         notify_die(DIE_TRAP)
            kprobe_exceptions_notify
               arc_post_kprobe_handler

But indeed we are *not* calling into kprobe_fault_handler() - from eithet of those
paths and not sure if the existing arc*_kprobe_handler() combination does the
equivalent in tandem.

-Vineet
