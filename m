From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Mon, 5 Mar 2018 17:24:50 +0800
Subject: mmc: dw_mmc: DRTO interrupt cause driver switch to PIO mode
In-Reply-To: <1519834261.8992.8.camel@synopsys.com>
References: <1519834261.8992.8.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <bd4c6407-b6b0-95d8-9308-52e1786d1fb3@rock-chips.com>
To: linux-snps-arc@lists.infradead.org



On 2018/3/1 0:11, Evgeniy Didin wrote:
> Hello everyone,
> 
> We have made some research of how driver behaves in case when changes [1] are not applied.
> Here in [2] was metioned that while transfering data
> after interrupt has happend driver went to PIO mode, that is not expected.
> Here is log:
> 
> | Running :??4M-check-reassembly-tcp-cmykw2-rotatew2.out -v0 -w1
> | -??Info: Finished target initialization.
> | mmcblk0: error -110 transferring data, sector 320544, nr 2048, cmd response
> |??0x900, card status 0x0
> | mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual
> | 396825HZ div = 63)
> | mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz, actual
> |??25000000HZ div = 1)
> | ------------[ cut here ]------------
> | softirq: huh, entered softirq 6 TASKLET 6f6a9412 with preempt_count 00000101,
> | exited with 00000100?
> | WARNING: CPU: 2 PID: 0 at ../lib/scatterlist.c:652 sg_miter_next+0x28/0x20c
> | Modules linked in:
> | CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.15.0 #57
> |
> | Stack Trace:
> |??arc_unwind_core.constprop.1+0xd0/0xf4
> |??dump_stack+0x68/0x80
> |??warn_slowpath_null+0x4e/0xec
> |??sg_miter_next+0x28/0x20c
> 
>>  ??dw_mci_read_data_pio+0x44/0x190
> 
> |??dw_mmc f000a000.mmc: Unexpected interrupt latency
> |???dw_mci_interrupt+0x3ee/0x530
> |??__handle_irq_event_percpu+0x56/0x150
> |??handle_irq_event+0x34/0x78
> |??handle_level_irq+0x8e/0x120
> |??generic_handle_irq+0x1c/0x2c
> |??idu_cascade_isr+0x30/0x6c
> |??__handle_domain_irq+0x72/0xc8
> |??ret_from_exception+0x0/0x8
> |---[ end trace 2a58c9af6c25fe51 ]---
> 
> 
> If I correctly understand behaviour, after interrupt has occurred, driver was in state "BUSY",
> than it checks status in dw_mci_data_complete() where SDMMC_INT_DRTO is set (drto_ms is not correct).
> After that function dw_mci_reset() is called.
> As I see after reset driver tries to restart,??dw_mci_idmac_start_dma() called in which dw_mci_prepare_desc32() is called.
> In that function descriptors states are checked, where one of descriptor is OWN-ed because we got interrupt while transferring data.
> After that driver jumps to "err_own_bit:", where it reinits IDMAC, but return value is -EINVAL, and afterall driver went into PIO mode:
> `dw_mci_submit_data_dma: fall back to PIO mode for current transfer"`
> 
> The problem is in checking descriptors statuses in IDMAC initialization, which are dirty.
> What do you think about clearing them in dw_mci_reset()?
> 

yes, we could clearing them and re-init the descriptor list there.
Would you mind posting a patch for that?

> Also I have checked how SDcard works in PIO mode, for that I made:
> 
> git diff drivers/mmc/host/dw_mmc.c
> @@ -2924,7 +2924,7 @@ static void dw_mci_init_dma(struct dw_mci *host)
>  ????????????????goto no_dma;
>  ????????}
> -
> +????????goto no_dma;
>  ????????/* Determine which DMA interface to use */
> 
> It doesn't work well:
> 
> 
> | Synopsys Designware Multimedia Card Interface Driver
> | dw_mmc f000a000.mmc: 'num-slots' was deprecated.
> | dw_mmc f000a000.mmc: Using PIO mode.
> | dw_mmc f000a000.mmc: Version ID is 290a
> | dw_mmc f000a000.mmc: DW MMC controller at irq 12,32 bit host data width,16 deep fifo
> ...
> 
> | # mount /dev/mmcblk0p2 2
> | EXT4-fs (mmcblk0p2): couldn't mount as ext3 due to feature incompatibilities
> | EXT4-fs (mmcblk0p2): couldn't mount as ext2 due to feature incompatibilities
> | EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
> | # cp 2/big_buck_bunny_1080p_h264.mov /tmp
> | INFO: task kworker/3:1H:131 blocked for more than 10 seconds.
> |??????Not tainted 4.16.0-rc2-00064-gaf3e79d29555-dirty #2
> | "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> | kworker/3:1H????D????0???131??????2 0x00000000
> | Workqueue: kblockd blk_mq_run_work_fn
> |
> | Stack Trace:
> |??__switch_to+0x0/0xac
> |??__schedule+0x1c4/0x598
> |??schedule+0x28/0x78
> |??mmc_blk_rw_wait+0x96/0xf8
> |??mmc_blk_mq_issue_rq+0x51a/0x880
> |??mmc_mq_queue_rq+0x136/0x1f8
> |??blk_mq_dispatch_rq_list+0xb0/0x5e8
> |??blk_mq_do_dispatch_sched+0x4c/0x9c
> |??blk_mq_sched_dispatch_requests+0xf0/0x15c
> |??blk_mq_run_work_fn+0x78/0x130
> |??process_one_work+0x194/0x338
> |??worker_thread+0xf0/0x464
> |??kthread+0x116/0x13c
> |??ret_from_fork+0x18/0x1c
> |INFO: task kworker/3:1H:131 blocked for more than 10 seconds.
> |??????Not tainted 4.16.0-rc2-00064-gaf3e79d29555-dirty #2
> |"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> |kworker/3:1H????D????0???131??????2 0x00000000
> |Workqueue: kblockd blk_mq_run_work_fn
> 
> I guess that is not expected. I am wondering was that mode have been tested?
> 

It did, and it still works for my boards now using PIO mode.
The log you posted looks more like a hung for mmc blk-mq issue.

> Best regards,
> Evgeniy Didin
> 
> [1] : https://www.spinics.net/lists/kernel/msg2734310.html
> [2] : https://www.spinics.net/lists/linux-mmc/msg48010.htmlN?????r??y???b?X???v?^?)?{.n?+????{??g"??^n?r???z???h????&??
?G???h?(????j"???m?????z?????f???h???~?mml==
> 
