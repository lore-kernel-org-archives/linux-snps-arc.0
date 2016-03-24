From: linux@arm.linux.org.uk (Russell King - ARM Linux)
Date: Thu, 24 Mar 2016 15:36:58 +0000
Subject: [PATCH 3/4] exit_thread: accept a task parameter to be exited
In-Reply-To: <1458824294-29733-1-git-send-email-jslaby@suse.cz>
References: <1458824294-29733-1-git-send-email-jslaby@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160324153658.GU19428@n2100.arm.linux.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 24, 2016@01:58:13PM +0100, Jiri Slaby wrote:
> We need to call exit_thread from copy_process in a fail path.  So make
> it accept task_struct as a parameter.

Hmm, so what this means is that exit_thread() can now be called for
threads which are not running on the CPU.  So, I think the comment
in arch/arm/vfp/vfpmodule.c needs to be updated:

 *  THREAD_NOTIFY_EXIT
 *   - the thread (v) will be running on the local CPU, so
 *      v === current_thread_info()

along with this change, since that becomes false.

The code, however, looks like it'll cope just fine with that being
false, as will the other users of THREAD_NOTIFY_EXIT in ARM.

Thanks.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
