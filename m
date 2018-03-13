From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Tue, 13 Mar 2018 12:04:35 +0000
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520942674.10285.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Adrian,

I have discovered, that beggining with 4.16-rc1 bonnie++ benchmark
runs with errors on arc/hsdk board. After bisecting between 4.15 and 4.16-rc1,
I have found that errors started after?
commit 81196976ed94 (mmc: block: Add blk-mq support).

Error message is like:

| # bonnie++ -u root -r 256 -s 512 -x 1 -d??/mnt?
| Using uid:0, gid:0.
| Writing with putc()...random: crng init done
| done
| Writing intelligently...INFO: task kworker/u8:0:5 blocked for more than 10 seconds.
|??????Not tainted 4.15.0-rc3-00012-g81196976ed94-dirty #1
| "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
| kworker/u8:0????D????0?????5??????2 0x00000000
| Workqueue: writeback wb_workfn (flush-179:0)
|
| Stack Trace:
|??__switch_to+0x0/0xac
|??__schedule+0x1b8/0x738
|??io_schedule+0x5c/0xc0
|??bit_wait_io+0xc/0x48
|??out_of_line_wait_on_bit+0x78/0xc0
|??do_get_write_access+0x1aa/0x4cc
|??jbd2_journal_get_write_access+0x32/0x74
|??__ext4_journal_get_write_access+0x3a/0xac
|??ext4_mb_mark_diskspace_used+0x66/0x5b0
|??ext4_mb_new_blocks+0x1ee/0x830
|??ext4_ext_map_blocks+0x504/0xcac
|??ext4_map_blocks+0x262/0x5e8
|??mpage_map_and_submit_extent+0xb8/0x648
|??ext4_writepages+0x5ce/0x6b4
|??do_writepages+0x20/0x84
|??__writeback_single_inode+0x2a/0x154
|??wb_writeback+0x538/0xae0
|??wb_workfn+0x17c/0x334
|??process_one_work+0x1a6/0x350
|??worker_thread+0xf2/0x478
|??kthread+0x120/0x13c
|??ret_from_fork+0x18/0x1c

There are some details of hsdk_defconfig presented bellow:

SOFTLOCKUP_DETECTOR=y
DETECT_HUNG_TASK=y
DEFAULT_HUNG_TASK_TIMEOUT=10
MMC_DW=y
MMC_DW_PLTFM=y

I have also tested bonnie++ on Wandboard on v4.16-rc5 with the same
DEFAULT_HUNG_TASK_TIMEOUT=10, but there were no errors.

Even though it is not critical error and we see bonnie++ test proceeds to the end,
still it is strange, that some process is running in kernel space for a long time (at least 10sec).
What is strange, before metioned commit I can't reproduce this behaviour.

I am wondering is this expected behaviour??

Best regards,
Evgeniy Didin
