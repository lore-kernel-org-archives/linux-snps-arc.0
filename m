From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 19 Dec 2017 13:39:22 -0800
Subject: [PATCH v2] arch: define weak abort
In-Reply-To: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f098f672-7b51-26ea-c215-2c3edf72e62b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/12/2017 02:49 PM, Sudip Mukherjee wrote:
> gcc toggle -fisolate-erroneous-paths-dereference (default at -O2
> onwards) isolates faulty code paths such as null pointer access, divide
> by zero etc. If gcc port doesnt implement __builtin_trap, an abort() is
> generated which causes kernel link error.
> 
> In this case, gcc is generating abort due to 'divide by zero' in
> lib/mpi/mpih-div.c.
> 
> Currently 'frv' and 'arc' are failing. Previously other arch was also
> broken like m32r was fixed by d22e3d69ee1a ("m32r: fix build failure").
> 
> Lets define this weak function which is common for all arch and fix the
> problem permanently. We can even remove the arch specific 'abort' after
> this is done.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
> ---
> 
> Hi Alexey,
> I was thinking of sending the m32r revert patch in few days. My m32r
> builds are having a little problem and should be fixed by this weekend.
> I can not test m32r before that. We can also send a patch to remove the
> same code in arm and unicore32.
> 
>   kernel/exit.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index af6c245..90c6869 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -1759,3 +1759,11 @@ long kernel_wait4(pid_t upid, int __user *stat_addr, int options,
>   	return -EFAULT;
>   }
>   #endif
> +
> +__weak void abort(void)
> +{
> +	BUG();
> +
> +	/* if that doesn't kill us, halt */
> +	panic("Oops failed to kill thread");
> +}

Hmm, I realize there's a small gotcha with this, when testing with a different 
patch from Arnd. This needs an EXPORT_SYMBOL() as well !

-Vineet
