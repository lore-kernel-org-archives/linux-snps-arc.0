From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 24 Mar 2016 14:03:03 +0100
Subject: [PATCH 3/4] exit_thread: accept a task parameter to be exited
In-Reply-To: <1458824294-29733-1-git-send-email-jslaby@suse.cz>
References: <1458824294-29733-1-git-send-email-jslaby@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160324130303.GS6356@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 24, 2016@01:58:13PM +0100, Jiri Slaby wrote:
>  void
> -exit_thread(void)
> +exit_thread(struct task_struct *me)
>  {
>  }

task_struct arguments are called: tsk, task, p
'me' seems very wrong, as that could only mean 'current', and its
clearly not that.
