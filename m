From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 21 Jul 2016 09:17:29 -0700
Subject: [PATCH] ARC: [*defconfigs] Enable hung tasks detection
In-Reply-To: <1469112735-26448-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1469112735-26448-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7c0e3361-cb65-b846-2b73-0715400b31d1@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/21/2016 07:52 AM, Eugeniy Paltsev wrote:
> Enable the kernel to detect "hung tasks",
> which are bugs that cause the task to be stuck in
> uninterruptible "D" state indefinitiley.

spellos above

> Note we're setting HUNG_TASK_TIMEOUT to 10 seconds instead of
> default 120 to shorten time required for detection of hung task,
> as it set in axs101, axs103 and axs103_smp boards defconfigs.

In some of the actual hang scenarios (on FPGA boards atleast) I was debugging, the
hung task seemed redundant actually as I was getting RCU stall msgs as well. Do
you not see something similar.


> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> Cc: Christian Ruppert <christian.ruppert at alitech.com>
> Cc: Noam Camus <noamca at mellanox.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Zakharov Vlad  <vzakhar at synopsys.com>
> ---
>  arch/arc/configs/nps_defconfig             | 2 ++
>  arch/arc/configs/nsim_700_defconfig        | 2 ++
>  arch/arc/configs/nsim_hs_defconfig         | 2 ++
>  arch/arc/configs/nsim_hs_smp_defconfig     | 2 ++
>  arch/arc/configs/nsimosci_defconfig        | 2 ++
>  arch/arc/configs/nsimosci_hs_defconfig     | 3 +++
>  arch/arc/configs/nsimosci_hs_smp_defconfig | 3 +++
>  arch/arc/configs/tb10x_defconfig           | 1 +
>  8 files changed, 17 insertions(+)
> 
> diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
> index ede625c..39ccacd 100644
> --- a/arch/arc/configs/nps_defconfig
> +++ b/arch/arc/configs/nps_defconfig
> @@ -81,4 +81,6 @@ CONFIG_DEBUG_INFO=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_MEMORY_INIT=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
>  CONFIG_ENABLE_DEFAULT_TRACERS=y
> diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
> index 7314f53..78c3070 100644
> --- a/arch/arc/configs/nsim_700_defconfig
> +++ b/arch/arc/configs/nsim_700_defconfig
> @@ -61,4 +61,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
>  # CONFIG_DEBUG_PREEMPT is not set
> diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
> index a99dc7a..c6a0a30 100644
> --- a/arch/arc/configs/nsim_hs_defconfig
> +++ b/arch/arc/configs/nsim_hs_defconfig
> @@ -59,4 +59,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
>  # CONFIG_DEBUG_PREEMPT is not set
> diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
> index 59f221f..10c5e5e 100644
> --- a/arch/arc/configs/nsim_hs_smp_defconfig
> +++ b/arch/arc/configs/nsim_hs_smp_defconfig
> @@ -58,3 +58,5 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
> index 42bafa5..973ce41 100644
> --- a/arch/arc/configs/nsimosci_defconfig
> +++ b/arch/arc/configs/nsimosci_defconfig
> @@ -71,3 +71,5 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
> index 4bb60c1..c0b99d7 100644
> --- a/arch/arc/configs/nsimosci_hs_defconfig
> +++ b/arch/arc/configs/nsimosci_hs_defconfig
> @@ -70,3 +70,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
> index 7e88f4c..4012585 100644
> --- a/arch/arc/configs/nsimosci_hs_smp_defconfig
> +++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
> @@ -84,3 +84,6 @@ CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  CONFIG_FTRACE=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
> index 4c51183..e8a96eb 100644
> --- a/arch/arc/configs/tb10x_defconfig
> +++ b/arch/arc/configs/tb10x_defconfig
> @@ -104,6 +104,7 @@ CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_MEMORY_INIT=y
>  CONFIG_DEBUG_STACKOVERFLOW=y
>  CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
>  CONFIG_SCHEDSTATS=y
>  CONFIG_TIMER_STATS=y
>  # CONFIG_CRYPTO_HW is not set
> 
