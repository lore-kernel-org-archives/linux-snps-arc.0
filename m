From: sashal@kernel.org (Sasha Levin)
Date: Wed, 15 May 2019 10:54:45 +0000
Subject: [PATCH 1/9] ARC: mm: SIGSEGV userspace trying to access kernel
 virtual memory
In-Reply-To: <1557880176-24964-2-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190515105445.E2C2920881@mail.kernel.org>
To: linux-snps-arc@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.1.1, v5.0.15, v4.19.42, v4.14.118, v4.9.175, v4.4.179, v3.18.139.

v5.1.1: Build OK!
v5.0.15: Build OK!
v4.19.42: Failed to apply! Possible dependencies:
    121e38e5acdc ("ARC: mm: fix uninitialised signal code in do_page_fault")
    15773ae938d8 ("signal/arc: Use force_sig_fault where appropriate")

v4.14.118: Failed to apply! Possible dependencies:
    121e38e5acdc ("ARC: mm: fix uninitialised signal code in do_page_fault")
    15773ae938d8 ("signal/arc: Use force_sig_fault where appropriate")
    1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")
    2c9120f3a86a ("arm64: signal: Make force_signal_inject more robust")
    3eb0f5193b49 ("signal: Ensure every siginfo we send has all bits initialized")
    3f7c86b2382e ("arm64: Update fault_info table with new exception types")
    50a7ca3c6fc8 ("mm: convert return type of handle_mm_fault() caller to vm_fault_t")
    526c3ddb6aa2 ("signal/arm64: Document conflicts with SI_USER and SIGFPE,SIGTRAP,SIGBUS")
    532826f3712b ("arm64: Mirror arm for unimplemented compat syscalls")
    5f74972ce69f ("signal: Don't use structure initializers for struct siginfo")
    92ff0674f5d8 ("arm64: mm: Rework unhandled user pagefaults to call arm64_force_sig_info")
    94ef7ecbdf6f ("arm64: fpsimd: Correctly annotate exception helpers called from asm")
    af40ff687bc9 ("arm64: signal: Ensure si_code is valid for all fault signals")
    bc0ee4760364 ("arm64/sve: Core task context handling")
    f43a54a0d916 ("signal/mips: Use force_sig_fault where appropriate")

v4.9.175: Failed to apply! Possible dependencies:
    0e3a9026396c ("arm64: mm: Update perf accounting to handle poison faults")
    121e38e5acdc ("ARC: mm: fix uninitialised signal code in do_page_fault")
    15773ae938d8 ("signal/arc: Use force_sig_fault where appropriate")
    32015c235603 ("arm64: exception: handle Synchronous External Abort")
    3eb0f5193b49 ("signal: Ensure every siginfo we send has all bits initialized")
    3f7c86b2382e ("arm64: Update fault_info table with new exception types")
    50a7ca3c6fc8 ("mm: convert return type of handle_mm_fault() caller to vm_fault_t")
    526c3ddb6aa2 ("signal/arm64: Document conflicts with SI_USER and SIGFPE,SIGTRAP,SIGBUS")
    532826f3712b ("arm64: Mirror arm for unimplemented compat syscalls")
    5b53696a30d5 ("ACPI / APEI: Switch to use new generic UUID API")
    5f74972ce69f ("signal: Don't use structure initializers for struct siginfo")
    7edda0886bc3 ("acpi: apei: handle SEA notification type for ARMv8")
    83016b204225 ("arm64: mm: print file name of faulting vma")
    92ff0674f5d8 ("arm64: mm: Rework unhandled user pagefaults to call arm64_force_sig_info")
    a8ada146f517 ("arm64: Update the synchronous external abort fault description")
    af40ff687bc9 ("arm64: signal: Ensure si_code is valid for all fault signals")
    b123718b105b ("MIPS: signal: Remove unreachable code from force_fcr31_sig().")
    bbcc2e7b642e ("ras: acpi/apei: cper: add support for generic data v3 structure")
    c07ab957d9af ("arm64: Call __show_regs directly")
    e7c600f149b8 ("arm64: hwpoison: add VM_FAULT_HWPOISON[_LARGE] handling")
    f43a54a0d916 ("signal/mips: Use force_sig_fault where appropriate")

v4.4.179: Failed to apply! Possible dependencies:
    09a6adf53d42 ("arm64: mm: unaligned access by user-land should be received as SIGBUS")
    0a8ea52c3eb1 ("arm64: Add HAVE_REGS_AND_STACK_ACCESS_API feature")
    0e3a9026396c ("arm64: mm: Update perf accounting to handle poison faults")
    121e38e5acdc ("ARC: mm: fix uninitialised signal code in do_page_fault")
    15773ae938d8 ("signal/arc: Use force_sig_fault where appropriate")
    2dd0e8d2d2a1 ("arm64: Kprobes with single stepping support")
    3eca86e75ec7 ("arm64: Remove fixmap include fragility")
    50a7ca3c6fc8 ("mm: convert return type of handle_mm_fault() caller to vm_fault_t")
    67ce16ec15ce ("arm64: mm: print out correct page table entries")
    83016b204225 ("arm64: mm: print file name of faulting vma")
    92ff0674f5d8 ("arm64: mm: Rework unhandled user pagefaults to call arm64_force_sig_info")
    bbb1681ee365 ("arm64: mm: mark fault_info table const")
    c07ab957d9af ("arm64: Call __show_regs directly")
    cab15ce604e5 ("arm64: Introduce execute-only page access permissions")
    d59bee887231 ("arm64: Add more test functions to insn.c")
    e04a28d45ff3 ("arm64: debug: re-enable irqs before sending breakpoint SIGTRAP")
    e7c600f149b8 ("arm64: hwpoison: add VM_FAULT_HWPOISON[_LARGE] handling")

v3.18.139: Failed to apply! Possible dependencies:
    04597a65c5ef ("arm64: Track system support for mixed endian EL0")
    121e38e5acdc ("ARC: mm: fix uninitialised signal code in do_page_fault")
    15773ae938d8 ("signal/arc: Use force_sig_fault where appropriate")
    1b907f46db07 ("arm64: kconfig: move emulation option under kernel features")
    2d888f48e056 ("arm64: Emulate SETEND for AArch32 tasks")
    338d4f49d6f7 ("arm64: kernel: Add support for Privileged Access Never")
    359b706473b4 ("arm64: Extract feature parsing code from cpu_errata.c")
    50a7ca3c6fc8 ("mm: convert return type of handle_mm_fault() caller to vm_fault_t")
    587064b610c7 ("arm64: Add framework for legacy instruction emulation")
    7209c868600b ("arm64: mm: Set PSTATE.PAN from the cpu_enable_pan() call")
    736d474f0faf ("arm64: Consolidate hotplug notifier for instruction emulation")
    870828e57b14 ("arm64: kernel: Move config_sctlr_el1")
    92ff0674f5d8 ("arm64: mm: Rework unhandled user pagefaults to call arm64_force_sig_info")
    94a9e04aa16a ("arm64: alternative: Introduce feature for GICv3 CPU interface")
    9b79f52d1a70 ("arm64: Add support for hooks to handle undefined instructions")
    bd35a4adc413 ("arm64: Port SWP/SWPB emulation support from arm")
    c852f3205846 ("arm64: Emulate CP15 Barrier instructions")
    c9453a3ab1a3 ("arm64: alternatives: fix pr_fmt string for consistency")
    ceed97ab4ff7 ("ARC: perf: Enable generic software events")
    e7c600f149b8 ("arm64: hwpoison: add VM_FAULT_HWPOISON[_LARGE] handling")


How should we proceed with this patch?

--
Thanks,
Sasha
